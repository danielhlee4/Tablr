@restaurants.each do |restaurant|
    json.set! restaurant.id do
        json.extract! restaurant, :id, :name, :description, :cuisine, :expense, :price_range, :neighborhood, :address, :phone, :website_url
    end
end

