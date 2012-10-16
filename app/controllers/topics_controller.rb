require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'yaml'

class TopicsController < ApplicationController


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