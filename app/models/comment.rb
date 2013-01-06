class Comment < ActiveRecord::Base
  belongs_to :state
  belongs_to :ticket
  belongs_to :user
  
  attr_accessible :text, :state_id
  
  after_create :set_ticket_state
  
  delegate :project, :to => :ticket
  
  validates :text, :presence => true
  
  private
  
  def set_ticket_state
    self.ticket.state = self.state
    self.ticket.save!
  end
  
end
