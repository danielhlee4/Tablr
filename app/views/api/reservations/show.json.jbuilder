json.extract! @reservation, :id, :party_size, :date, :time, :occasion, :created_at, :updated_at

json.user do
  json.firstName @reservation.user.first_name
  json.lastName @reservation.user.last_name
  json.id @reservation.user.id
end

json.restaurant do
  json.id @reservation.restaurant.id
  json.name @reservation.restaurant.name
  json.photoUrl (@reservation.restaurant.photo.attached? ? @reservation.restaurant.photo.url : nil)
end