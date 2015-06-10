#!/usr/bin/env ruby

list = File.read(ARGV[0])
dir  = ARGV[1]

list.each_line do |line|
  line.chomp!
  if !File.exist?("#{dir}/#{line}.sid")
    `wget -q  'http://bsm07.freac.fsu.edu/Hi-Res-Imagery/deliverfiles.cfm?thefile=#{line}.sdw&thefullpath=S:\\Delivery\\2014\\Manatee\\sid\\#{line}.sid\' -O #{dir}/#{line}.sid`
    puts "File #{line}.sid skipped."
  elsif !File.exist?("#{dir}/#{line}.sdw")
    `wget -q  'http://bsm07.freac.fsu.edu/Hi-Res-Imagery/deliverfiles.cfm?thefile=#{line}.sdw&thefullpath=S:\\Delivery\\2014\\Manatee\\sid\\#{line}.sdw\' -O #{dir}/#{line}.sdw`
    puts "File #{line}.sdw skipped."
  elsif !File.exist?("#{dir}/#{line}.aux")
    `wget -q  'http://bsm07.freac.fsu.edu/Hi-Res-Imagery/deliverfiles.cfm?thefile=#{line}.sdw&thefullpath=S:\\Delivery\\2014\\Manatee\\sid\\#{line}.aux\' -O #{dir}/#{line}.aux`
    puts "File #{line}.aux skipped."
  end
end
