require 'open-uri'
require 'csv'
require 'json'

project = ARGV[0]
token = ARGV[1]
filename = "stories-#{Time.now.utc}.csv"

stories = JSON.parse open("https://api.clubhouse.io/api/v1/projects/#{project}/stories?token=#{token}").read
epics = JSON.parse open("https://api.clubhouse.io/api/v1/epics?token=#{token}").read
workflow = JSON.parse open("https://api.clubhouse.io/api/v1/workflows?token=#{token}").read


CSV.open(filename, "w", col_sep: ",",  force_quotes: true) do |csv|
  csv << ["Id", "Title", "Type", "Labels", "Size", "Epic", "Description", "Workflow State"]
  stories.each do |s|
    epic_name = unless s['epic'].nil? || s['epic'].empty?
      epics.find{|e| e['id'] == s['epic'].first['id'] }['name']
    else
      ""
    end
    csv << [
      s['id'],
      s['name'],
      s['story_type'],
      s['labels'].map{|l| l['name'] }.join(", "),
      s['estimate'],
      epic_name,
      s['description'].gsub("\n", "\r\n"),
      workflow.first['states'].find{|e| e['id'] == s['workflow_state_id'] }['name']
    ]
  end
end

`open "#{filename}"`
