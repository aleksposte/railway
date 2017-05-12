class TicketMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def cancel_ticket(ticket)
    @serial_number = ticket.serial_number
    @user = ticket.user
    mail(to: @user.email, subject: 'Вы отменили покупку билета')
  end

end
