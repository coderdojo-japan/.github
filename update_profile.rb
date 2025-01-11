#!/usr/bin/env ruby

require 'net/http'
require 'json'

BASE_URL   = 'https://coderdojo.jp'
DOJO_STATS = JSON.parse Net::HTTP.get(URI.parse "#{BASE_URL}/stats.json"), symbolize_names: true

puts "DOJO_STATS: " + DOJO_STATS[:active_dojos].to_s

profile = ''
File.read('profile/README.md').each_line do |line|
  line.sub!(/(\d+)カ所以上/, "#{DOJO_STATS[:active_dojos]}カ所以上")
  profile << line
end
puts
puts profile.lines[2]

File.open('profile/README.md', 'w') { it.write profile }
