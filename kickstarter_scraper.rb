# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
    projects = {
      
    }
  
  kickstarter.css('.project').each do |i|
    project = projects[i.css('.bbcard_name a').text] = {}
    project[:image_link] = i.css('.project-thumbnail img').attribute('src').value
    project[:description] = i.css('.bbcard_blurb').text.strip
    project[:location] = i.css('.location-name').text
    project[:percent_funded] = i.css('.pledged strong').text.gsub("%","").to_i
  end
  
  projects
end