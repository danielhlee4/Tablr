class Review < ApplicationRecord
    belongs_to :reservation
    has_one :user, through: :reservation
    has_one :restaurant, through: :reservation
end