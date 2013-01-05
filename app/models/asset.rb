class Asset < ActiveRecord::Base
  belongs_to :ticket
  
  attr_accessible :asset
  has_attached_file :asset, :path => (Rails.root + "files/:id").to_s,
                            :url => "/files/:id"
end
