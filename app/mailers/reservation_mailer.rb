class ReservationMailer < ApplicationMailer
  def confirmation_email(reservation)
    @reservation = reservation
    mail(to: @reservation.client.email, subject: 'Flight Reservation Confirmation')
  end
end