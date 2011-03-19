#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

developer_tools_url = "http://www.opensource.apple.com/release/developer-tools-324/"

doc = Nokogiri::HTML(open(developer_tools_url))

nametds = doc.xpath('//td[@class="project-name "]')

nametds.each do |td|

  puts td.content.strip.split("-")[0]
end
