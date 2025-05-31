#!/usr/bin/env ruby

# Helper to create a sanitized filename from a title
def generate_filename(title_str)
  # Ensure we're working with a string
  s = String(title_str)

  # 1. Downcase
  s = s.downcase

  # 2. Replace spaces and common separators with hyphens
  s = s.gsub(/\s+|_|\//, '-') # Replace spaces, underscores, slashes with hyphens

  # 3. Remove special characters except word characters (alphanumeric + underscore) and hyphens
  s = s.gsub(/[^\w\-]/, '')

  # 4. Remove leading/trailing hyphens
  s = s.gsub(/^-+|-+$/, '')

  # 5. Collapse multiple hyphens into one
  s = s.gsub(/-{2,}/, '-')

  # 6. Handle empty or hyphen-only string after sanitization
  if s.empty? || s == '-'
    return "untitled-project-#{Time.now.to_i}.md" # Fallback filename
  end

  s + ".md"
end

# --- Main script logic ---
puts "🚀 Let's create a new project (EN & ES versions)!"

# --- Shared Details ---
print "Unique Project Slug/ID (e.g., 'my-portfolio', for linking translations): "
translation_id = STDIN.gets.chomp.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
abort("ABORTED: Project Slug/ID cannot be empty and must be valid.") if translation_id.empty? || translation_id == '-'


puts "\n--- Shared Project Details (often same for both languages) ---"
print "Image Path (e.g., /assets/images/project.jpg): "
image_path = STDIN.gets.chomp

print "Tech Stack (comma-separated, e.g., Ruby,JavaScript,HTML): "
tech_stack_str = STDIN.gets.chomp
tech_stack = tech_stack_str.split(',').map(&:strip).reject(&:empty?)

print "Repository URL (optional): "
repo_url = STDIN.gets.chomp

print "Live URL (optional): "
live_url = STDIN.gets.chomp

project_date = Time.now.strftime('%Y-%m-%d')

# --- Language-Specific Details ---
details_by_lang = {}
languages_to_create = ["en", "es"]

languages_to_create.each do |lang|
  puts "\n--- Entering details for #{lang.upcase} version ---"
  print "Project Title (#{lang.upcase}): "
  title = STDIN.gets.chomp.strip # Add strip here
  abort("ABORTED: Title for #{lang.upcase} cannot be empty.") if title.empty?

  print "Short Description (for cards, #{lang.upcase}): "
  short_description = STDIN.gets.chomp.strip # Add strip here

  generated_fn = generate_filename(title) # Generate filename from this language's title
  puts "   (Generated filename will be: #{generated_fn})" # Show user the generated filename

  details_by_lang[lang] = {
    title: title,
    short_description: short_description,
    filename: generated_fn
  }
end

# --- Create Files ---
PROJECTS_BASE_DIR = "_projects"
Dir.mkdir(PROJECTS_BASE_DIR) unless Dir.exist?(PROJECTS_BASE_DIR)

details_by_lang.each do |lang, details|
  PROJECTS_LANG_DIR = File.join(PROJECTS_BASE_DIR, lang)
  Dir.mkdir(PROJECTS_LANG_DIR) unless Dir.exist?(PROJECTS_LANG_DIR)

  filepath = File.join(PROJECTS_LANG_DIR, details[:filename])

  # Escape double quotes in string values for YAML
  yaml_title = details[:title].gsub('"', '\"')
  yaml_short_desc = details[:short_description].gsub('"', '\"')
  yaml_image_path = image_path.gsub('"', '\"')
  yaml_tech_stack = tech_stack.map { |t| "\"#{t.gsub('"', '\"')}\"" }.join(', ')
  yaml_repo_url = repo_url.gsub('"', '\"')
  yaml_live_url = live_url.gsub('"', '\"')


  front_matter = <<~FM
    ---
    layout: project
    lang: #{lang}
    translation_id: #{translation_id}
    title: "#{yaml_title}"
    short_description: "#{yaml_short_desc}"
    image_path: "#{yaml_image_path}"
    date: #{project_date}
    tech_stack: [#{yaml_tech_stack}]
    repo_url: "#{yaml_repo_url}"
    live_url: "#{yaml_live_url}"
    # tags: []
    ---

    This is the main content area for '#{details[:title]}' (in #{lang.upcase}).
    Write your detailed project description here in #{lang.upcase} using Markdown.
    This project is part of the '#{translation_id}' translation set.
  FM

  if File.exist?(filepath)
    puts "⚠️  Error: File #{filepath} already exists for lang '#{lang}'. Skipping."
  else
    File.write(filepath, front_matter)
    puts "✅ Project file created: #{filepath}"
  end
end

puts "\n👉 All specified language versions potentially created for project '#{translation_id}'."
puts "   Now edit the main content within each generated .md file!"