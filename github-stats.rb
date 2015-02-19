require 'json'
require 'pry'
require 'httparty'
require "./db/setup"
require "./lib/all"



#TIY-DC-ROR-2015-Jan
#Program should:
    # Prompt the user for an auth token (falling back public if none given): COMPLETE
    # Prompt the user for a github organization to report on: COMPLETE
    # Produce a table of contributions: COMPLETE

puts "Welcome to Get Github Contributor Stats"


puts "Please enter the name of Github organization you would like constribution information for: "
orgname = gets.chomp.to_s

gh = Github.new(orgname)

#if orgname has stats, clear all stats for all users before next call since not yet set up to compare to previous call and just add new info
#Org linking not working, but that's incidental to main concepts learned here. For now, just clear all users on start.
# if Org.where(org_name: orgname)
#   #set data for users with org ID to 0
# end

puts "Setting up Database. Please wait."
Stat.clear_table

puts "Getting information..."
gh.grab_org_members(gh.org_name)
gh.grab_usernames(gh.members)
puts "Organizing information..."
gh.add_user_contributions(gh.usernames)


puts "\n\n\n"
Stat.display_stats
puts "This is the end of the script."
