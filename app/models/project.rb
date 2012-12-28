class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :tickets, :dependent => :delete_all
  
  validates :name, :presence => true
end
