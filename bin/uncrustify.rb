#!/usr/bin/ruby

base_path = ENV['XcodeProjectPath'] + "/.."

puts "running uncrustify for xcode project path: #{base_path}"

if base_path != nil
  paths = `find "#{base_path}" -name "*.m" -o -name "*.h" -o -name "*.mm" -o -name "*.c"`
  paths = paths.collect do |path|
    path.gsub(/(^[^\n]+?)(\n)/, '"\\1"')
  end
  paths.delete_if { |path| path.index("libs") || path.index("SBJson") || path.index("GHUnitIOS") || path.index("FMDB"); }
  paths = paths.join(" ")
  result = `/opt/local/bin/uncrustify -c /Users/Atsushi/bin/uncrustify.cfg --no-backup #{paths}`;
  puts result
else
  puts "Invalid base path..."
end
