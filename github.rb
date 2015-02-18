#Github Class through HTTParty

class Github

  TOKEN = File.read("./token.txt")

  include HTTParty
  base_uri "https://api.github.com"
  headers 'Authorization' => "token #{TOKEN}", "User-Agent" => "classbot"
  #default_options headers: ...

  #Define Token constant


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

  def grab_user_contributions usernames
    usernames.each do |un|
      repos = Github.get("/users/#{un}/repos")
      repos.each do |r|
        begin
        @cont = Github.get("/repos/#{un}/#{r["name"]}/stats/contributors")
        additions = @cont[0]["weeks"][0]["a"]
        deletions = @cont[0]["weeks"][0]["d"]
        changes = @cont[0]["weeks"][0]["c"]
        rescue
        end
      end
    end
    return @cont
  end

end