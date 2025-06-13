Jekyll::Hooks.register :site, :post_write do |site|
  
  site.config['languages'].each do |lang|
    next if lang == site.config['default_lang']

    lang_dir = File.join(site.dest, lang)
    source_file = File.join(lang_dir, "index.#{lang}.html")
    target_file = File.join(lang_dir, "index.html")

    if File.exist?(source_file)
      puts "Polyglot Post-Write Hook: Renaming #{source_file} to #{target_file}"
      File.rename(source_file, target_file)
    elsif File.exist?(target_file) && File.basename(target_file) == "index.html" && !File.exist?(source_file)
     
    end
  end
end