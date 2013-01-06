class Comment < ActiveRecord::Base
  belongs_to :previous_state, :class_name => "State"
  belongs_to :state
  belongs_to :ticket
  belongs_to :user
  
  attr_accessible :text, :state_id
  
  delegate :project, :to => :ticket
  
  validates :text, :presence => true
  
  before_create :set_previous_state
  after_create :set_ticket_state
  
  private
  
  def set_ticket_state
    self.ticket.state = self.state
    self.ticket.save!
  end
  
  def set_previous_state
    self.previous_state = ticket.state
  end
end
