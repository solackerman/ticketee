class Ticket < ActiveRecord::Base
  searcher do
    label :tag, :from => :tags, :field => :name
    label :state, :from => :state, :field => :name
  end
  
  belongs_to :project
  belongs_to :state
  belongs_to :user

  has_many :assets
  has_many :comments
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, :join_table => "ticket_watchers",
                                     :class_name => "User"
  
  accepts_nested_attributes_for :assets

  attr_accessible :description, :title, :assets_attributes, :tag_names
  attr_accessor :tag_names

  validates :title, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }
  
  before_create :associate_tags
  after_create :creator_watches_me

  private

  def associate_tags
    if tag_names
      tag_names.split(" ").each do |name|
        self.tags << Tag.find_or_create_by_name(name)
      end
    end
  end
  
  def creator_watches_me
    if user
      self.watchers << user unless self.watchers.include?(user)
    end
  end
  
end
