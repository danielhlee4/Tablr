json.array! @reviews do |review|
  json.extract! review, :id, :overall_rating, :food_rating, :service_rating, :ambiance_rating, :value_rating, :body, :restaurant_id, :created_at

  json.reservation do
    json.extract! review.reservation, :id, :date
    json.user do
      json.extract! review.reservation.user, :first_name, :last_name
    end
  end
end