file_cache_path "#{ENV['HOME']}/.chef/cache"
backup_path "#{ENV['HOME']}/.chef/backup"
checksum_path "#{ENV['HOME']}/.chef/checksums"
cookbook_path File.expand_path(File.join(File.dirname(__FILE__), "..", "cookbooks"))
