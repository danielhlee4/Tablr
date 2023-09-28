json.reservations do
  @reservations.each do |reservation|
    json.set! reservation.id do
      json.extract! reservation, :id, :party_size, :date, :time, :occasion, :created_at, :updated_at

      json.user do
        json.firstName reservation.user.first_name
        json.lastName reservation.user.last_name
      end

      json.restaurant do
        json.name reservation.restaurant.name
        json.photoUrl (reservation.restaurant.photo.attached? ? reservation.restaurant.photo.url : nil)
      end
    end
  end
end