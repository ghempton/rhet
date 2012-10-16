require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'yaml'


def get_url(category, page) #for getting specific url links

		url = "http://idebate.org/debatabase/themes/"
		url += "/#{category}"
		if(page > 1)
			url += "?page=#{page}"
		end
		url
end


example_cat_array = [
        
        { "label" => "environment", "number_of_pages" => [1,2] }, 
        { "label" => "international", "number_of_pages" => [1,2,3,4] },
        { "label" => "economy", "number_of_pages" => [1,2,3] },
        { "label" => "politics", "number_of_pages" => [1,2,3,4,5] },  
        { "label" => "culture", "number_of_pages" => [1,2] },
        { "label" => "education", "number_of_pages" => [1,2] },
        { "label" => "health", "number_of_pages" => [1,2] },
        { "label" => "law", "number_of_pages" => [1,2,3,4] },
        { "label" => "religion", "number_of_pages" => [1,2] },
        { "label" => "society", "number_of_pages" => [1,2,3] },
        { "label" => "philosophy", "number_of_pages" => [1,2] },
        { "label" => "science", "number_of_pages" => [1,2] },
        { "label" => "freespeech", "number_of_pages" => [1]},
        ]
	
cat_master_hash = Hash.new

example_cat_array.each do |page_hash|
    pages = page_hash["number_of_pages"]
    category_name = page_hash["label"]
    cat_master_hash[category_name] = Array.new
    pages.each do |page_num|
        current_url = get_url(category_name, page_num)
        scraped_results = Nokogiri::HTML(open(current_url))
        scraped_results.css('div > span > a').each do |parsing|
            if parsing.content.length >= 24
                parsed_results = parsing.content
                cat_master_hash[category_name] << parsed_results
                cat_master_hash[category_name].uniq!
            end
        end
            
    end
end
f = File.open('topics.yml', 'w')
YAML.dump(cat_master_hash, f)