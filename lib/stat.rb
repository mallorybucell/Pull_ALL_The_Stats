class Stat <ActiveRecord::Base
  has_many :org_stats
  has_many :organizations, through: :org_stats

  def update_additions!(int)
    # self.additions = 0
    self.additions += int
    self.save!
  end

  def self.clear_table
    self.delete_all
  end

  def self.display_stats
    #Titles
    puts "User".ljust(20) + "Additions".ljust(20) + 
      "Deletions".ljust(20) + "Changes".ljust(20)
    #Data
    self.find_each do |p|
      puts "#{p.user}".ljust(20) + "#{p.additions}".ljust(20) + 
      "#{p.deletions}".ljust(20) + "#{p.total_changes}".ljust(20)
    end
  end

  def update_deletions!(int)
    # self.deletions = 0
    self.deletions += int
    self.save!
  end

  def update_changes!(int)
    # self.total_changes = 0
    self.total_changes += int
    self.save!
  end

end