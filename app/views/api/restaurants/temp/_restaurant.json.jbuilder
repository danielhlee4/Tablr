json.extract! restaurant, :id, :name
json.photoUrl restaurant.photo.attached? ? restaurant.photo.url : nil