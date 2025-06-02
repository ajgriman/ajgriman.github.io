#!/usr/bin/env ruby

def generate_filename(title_str)
  s = String(title_str)
  s = s.downcase
  s = s.gsub(/\s+|_|\//, '-')
  s = s.gsub(/[^\w\-]/, '')
  s = s.gsub(/^-+|-+$/, '')
  s = s.gsub(/-{2,}/, '-')
  if s.empty? || s == '-'
    return "untitled-project-#{Time.now.to_i}.md"
  end
  s + ".md"
end

puts "🚀 Let's create a new project (EN & ES versions)!"

print "Common Project Page ID (e.g., 'project-alpha', for linking translations): "
page_id = STDIN.gets.chomp.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
abort("ABORTED: Project Page ID cannot be empty and must be valid.") if page_id.empty? || page_id == '-'

puts "\n--- Shared Project Details (often same for both languages) ---"
print "Primary Image Path (e.g., /assets/images/project.jpg): "
image_path = STDIN.gets.chomp.strip

print "Alternative Image Path (optional, e.g., /assets/images/project-alt.jpg): "
image_path_alt = STDIN.gets.chomp.strip

print "Video URL (optional, e.g., https://youtube.com/watch?v=XXXXX): "
video_url = STDIN.gets.chomp.strip

print "Tech Stack (comma-separated, e.g., Ruby,JavaScript,HTML): "
tech_stack_str = STDIN.gets.chomp
tech_stack = tech_stack_str.split(',').map(&:strip).reject(&:empty?)

print "Repository URL (optional): "
repo_url = STDIN.gets.chomp.strip

print "Live URL (optional): "
live_url = STDIN.gets.chomp.strip

project_date = Time.now.strftime('%Y-%m-%d')

lorem_ipsum_placeholder = <<~LOREM
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,
  eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
LOREM

details_by_lang = {}
languages_to_create = ["en", "es"]

languages_to_create.each do |lang|
  puts "\n--- Entering details for #{lang.upcase} version ---"
  print "Project Title (#{lang.upcase}): "
  title = STDIN.gets.chomp.strip
  abort("ABORTED: Title for #{lang.upcase} cannot be empty.") if title.empty?

  print "Short Description (for cards, #{lang.upcase}): "
  short_description = STDIN.gets.chomp.strip

  generated_fn = generate_filename(title)
  puts "   (Generated filename will be: #{generated_fn})"

  details_by_lang[lang] = {
    title: title,
    short_description: short_description,
    filename: generated_fn
  }
end

PROJECTS_BASE_DIR = "_projects"
Dir.mkdir(PROJECTS_BASE_DIR) unless Dir.exist?(PROJECTS_BASE_DIR)

details_by_lang.each do |lang, details|
  filepath = File.join(PROJECTS_BASE_DIR, details[:filename])

  yaml_title = details[:title].gsub('"', '\"')
  yaml_short_desc = details[:short_description].gsub('"', '\"')
  yaml_image_path = image_path.gsub('"', '\"')
  yaml_image_path_alt = image_path_alt.gsub('"', '\"')
  yaml_video_url = video_url.gsub('"', '\"')
  yaml_tech_stack = tech_stack.map { |t| "\"#{t.gsub('"', '\"')}\"" }.join(', ')
  yaml_repo_url = repo_url.gsub('"', '\"')
  yaml_live_url = live_url.gsub('"', '\"')

  front_matter_lines = [
    "---",
    "layout: project",
    "lang: #{lang}",
    "page_id: #{page_id}",
    "title: \"#{yaml_title}\"",
    "short_description: \"#{yaml_short_desc}\"",
    "image_path: \"#{yaml_image_path}\"",
  ]
  front_matter_lines << "image_path_alt: \"#{yaml_image_path_alt}\"" unless image_path_alt.empty?
  front_matter_lines << "video_url: \"#{yaml_video_url}\"" unless video_url.empty?
  front_matter_lines += [
    "date: #{project_date}",
    "tech_stack: [#{yaml_tech_stack}]",
    "repo_url: \"#{yaml_repo_url}\"",
    "live_url: \"#{yaml_live_url}\"",
    "# tags: []",
    "---",
    "",
    lorem_ipsum_placeholder,
    "",
    "This project ('#{details[:title]}' - #{lang.upcase}) is part of the '#{page_id}' page_id set."
  ]
  front_matter_content = front_matter_lines.join("\n")

  if File.exist?(filepath)
    puts "⚠️  Error: File #{filepath} already exists. Skipping."
  else
    File.write(filepath, front_matter_content)
    puts "✅ Project file created: #{filepath}"
  end
end

puts "\n👉 All specified language versions potentially created for project '#{page_id}'."
puts "   Review and edit the Lorem Ipsum content within each generated .md file!"