@restaurants.each do |restaurant|
    json.set! restaurant.id do
        json.extract! restaurant, :id, :name, :description, :cuisine, :expense, :price_range, :neighborhood, :address, :phone, :website_url
        json.photoUrl (restaurant.photo.attached? ? restaurant.photo.url : nil)
    end
end
