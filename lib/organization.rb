class Organization <ActiveRecord::Base
  has_many :contributorstatistics, through: :org_stats
end