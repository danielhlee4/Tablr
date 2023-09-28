json.restaurants({})

json.restaurants do
    @restaurants.each do |restaurant|
        json.set! restaurant.id do
            json.extract! restaurant, :id, :name, :expense, :neighborhood
        end
    end
end