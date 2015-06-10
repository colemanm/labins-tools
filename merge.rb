#!/usr/bin/env ruby

require 'yaml'

list   = File.read(ARGV[0])
path   = YAML.load(File.read("paths.yml"))['working_dir']
output = ARGV[1]

images = ""
list.each_line do |file|
  file.chomp! << ".sid"
  file.insert(0, path)
  images << "#{file} "
end

`gdalwarp -of GTiff #{images} #{output}`
