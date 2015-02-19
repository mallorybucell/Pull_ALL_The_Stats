#Github Class through HTTParty
require "./db/setup"
require "./lib/all"
require "json"

class Github

  TOKEN = File.read("./token.txt") || get_token || null

  include HTTParty
  base_uri "https://api.github.com"
  headers 'Authorization' => "token #{TOKEN}", "User-Agent" => "classbot"
  #default_options headers: ...

  #Define get user Token constant
  def get_token
    puts "Please enter your Authentication token: "
    gets.chomp
  end


  def initialize(name)
    @org_name = name
  end

  def org_name
    @org_name
  end

  def usernames
    @usernames
  end

  def members
    @members
  end

  def usernames
    @usernames
  end

  def repos
    @repos
  end

  def cont
    @cont
  end

  def grab_org_members org_name
    m = Github.get("/orgs/#{org_name}/members")
    @members = m
  end

  def grab_usernames members
    @usernames = []
    members.each do |u|
      @usernames << u["login"]
    end
    return @usernames
  end

  def add_user_contributions usernames
    usernames.each do |un|
      repos = Github.get("/users/#{un}/repos")
      repos.each do |r|
        print "..."
        begin
        @cont = Github.get("/repos/#{un}/#{r["name"]}/stats/contributors")
          Stat.where(user: un).first_or_create!.
          update_additions!(@cont[0]["weeks"][0]["a"].to_i)
          Stat.where(user: un).first_or_create!.
          update_deletions!(@cont[0]["weeks"][0]["d"].to_i)
          Stat.where(user: un).first_or_create!.
          update_changes!(@cont[0]["weeks"][0]["c"].to_i)
        rescue
        end
      end
    end
    return @cont
  end

end