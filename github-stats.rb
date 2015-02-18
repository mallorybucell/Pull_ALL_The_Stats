require 'json'
require 'pry'
require 'httparty'
require_relative './github.rb'

#TIY-DC-ROR-2015-Jan
# Running ruby github-stats.rb should:
#add rescue (begin, rescue) before github call to class repos


puts "Please enter the name of Github organization you would like constribution information for: "
orgname = gets.chomp.to_s

gh = Github.new(orgname)

#     Prompt the user for an auth token (falling back public if none given)
#     Prompt the user for a github organization to report on
gh.grab_org_members(gh.org_name)
gh.grab_usernames(gh.members)
gh.grab_user_contributions(gh.usernames)
puts "This is the end of the script."






# get_user_repo_url = ["/users/#{username}/repos"]

# get_user_collab_info_url = ["/repos/#{username}/#{repo}/stats/contributors"]
#"weeks": "a", #"weeks": "d", #"total" (commits overall == changes?)

#Produce a table of contributions
#Access a given (public) organization



        #Get each user
        #For each user, 
        #get repos
        #aggregate (and store?) additions, deletions, changes/commits to each repo in a db with row being username
        #Print line for each user



#For REFERENCE
# url = "https://api.github.com/orgs/TIY-DC-ROR-2015-Jan/repos"

# response = `curl #{url}`
# data = JSON.parse response

# # Try poking around here and taking a look at `data`
# # binding.pry

# random_repo = data.sample
# puts "#{random_repo['name']} is located at #{random_repo['html_url']}"

#Get all repos for org
# curl -i https://api.github.com/orgs/TIY-DC-ROR-2015-Jan/repos?type=all -H "Authorization: token 9ac6530adf8083649de6efdd672ddf5bcf7547e6"

#Get collabs of specific repo
# curl -i https://api.github.com/repos/TIY-DC-ROR-2015-Jan/to_do_list/collaborators -H "Authorization: token 9ac6530adf8083649de6efdd672ddf5bcf7547e6"
