require 'json'
require 'pry'
require 'httparty'
require "./db/setup"
require "./lib/all"
#add db requirements

#TIY-DC-ROR-2015-Jan
# Running ruby github-stats.rb should:
#add rescue (begin, rescue) before github call to class repos


puts "Welcome to Get Github Contributor Stats"
puts "Please enter the name of Github organization you would like constribution information for: "
orgname = gets.chomp.to_s

gh = Github.new(orgname)

gh.grab_org_members(gh.org_name)
gh.grab_usernames(gh.members)
gh.grab_user_contributions(gh.usernames)
#Add printed DB here
puts "This is the end of the script."
