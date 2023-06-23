class ReservationController < ActionController::Base
  layout "application"
  before_action :authenticate_client!

  def create
    # Create a new reservation with the form data
    reservation = Reservation.new(reservation_params)
    reservation.client = current_client

    # Generate a unique alphanumeric reference for the reservation
    loop do
      reservation.pnr = SecureRandom.alphanumeric(6).upcase
      break unless Reservation.joins(:flight).where("reservations.pnr = ? AND flights.departure_date > ?", reservation.pnr, Time.now).exists?  # TODO vérif que sur resa a venir
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

  def history
    @reservations = Reservation.where(client_id: current_client.id).paginate(page: params[:page], per_page: 10)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:flight_id, :category, :nb_seats)
  end

end