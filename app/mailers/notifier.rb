class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"
  
  def comment_updated(comment, user)
    @comment = comment
    @user = user
    @ticket = comment.ticket
    subject = "[ticketee] #{@ticket.project.name} - #{@ticket.title}"
    mail(:to => user.email, :subject => subject)
  end
end
