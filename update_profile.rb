#!/usr/bin/env ruby

require 'net/http'
require 'json'

BASE_URL   = 'https://coderdojo.jp'
DOJO_STATS = JSON.parse Net::HTTP.get(URI.parse "#{BASE_URL}/stats.json"), symbolize_names: true

puts "DOJO_STATS: " + DOJO_STATS[:active_dojos].to_s
profile = File.read('profile/README.md')
profile.sub!(/日本全国(\d+)/, "日本全国#{DOJO_STATS[:active_dojos]}")

File.open('profile/README.md', 'w') do |file|
  file.write(profile)
end
