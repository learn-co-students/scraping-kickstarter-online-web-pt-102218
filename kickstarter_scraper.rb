# require libraries/modules here

require 'nokogiri'
require 'open-uri'

def create_project_hash
  # write your code here
  projects ={}
  doc = Nokogiri::HTML(open('./fixtures/kickstarter.html')).css('.project-card')
  doc.each{|project_mu|
  projects[project_mu.css('strong').css('a').text] = {
    :description=>project_mu.css('p').text,
    :image_link=>project_mu.css('a').css('img').attr('src').text,
    :location=>project_mu.css('.location-name').text,
    :percent_funded=>project_mu.css('.funded').css('strong').text.to_i
  }
  #puts project_mu.css('.project-meta').css('.location-name').text
}
  projects
end

#puts create_project_hash