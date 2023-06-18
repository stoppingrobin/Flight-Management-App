class ReservationController < ActionController::Base
  def create
    # Create a new reservation with the form data
    reservation = Reservation.new(reservation_params)
    reservation.client = current_client

    # Generate a unique alphanumeric reference for the reservation
    loop do
      reservation.pnr = SecureRandom.alphanumeric(6)
      break unless Reservation.exists?(pnr: reservation.pnr)  # TODO vérif que sur resa a venir
    end

    if reservation.save
      # Send the confirmation email
      ReservationMailer.confirmation_email(reservation).deliver_now

      # Redirect to the success page
      redirect_to({ action: :success, id: reservation.id })
    else
      puts reservation.errors.messages
      # Handle errors (e.g. render the form again with error messages)
    end
  end
  def new
    @flight = Flight.find(params[:flight_id])
    @reservation = Reservation.new
  end

  def success
    @reservation = Reservation.find(params[:id])
  end

  def delete
    reservation = Reservation.find(params[:id])

    if reservation.client == current_client
      reservation.destroy
      # Redirect to a page indicating the reservation has been deleted
      flash["notice"] = "Booking deleted with great success !"
      redirect_to({ controller: :home, action: :index})
    else
      # Redirect to an error page or show an error message
      flash["notice"] = "Couldn't delete booking'((("
      redirect_to({ controller: :home, action: :index})
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:flight_id, :category, :nb_seats)
  end

end