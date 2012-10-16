require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

class TopicsController < ApplicationController

#need a way to expand/collapse topic areas -- jquery?
#topic randomization/selection (with category choice, without)
#links to wiki pages based on keywords (some way to automate using source file?) crawl 'further reading' for pdfs and links

	def intro
		 @cat_master_hash = YAML.load_file('topics.yml')
		 
		@area_paragraphs = Array.new
		@topic_li_items = Array.new

		@cat_master_hash.keys.each do |printing|
			@area_paragraphs << printing
		end	

		@cat_master_hash.values.each do |printing|
			@topic_li_items << printing
		end
		

	
	end

end