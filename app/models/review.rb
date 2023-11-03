# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  reservation_id  :bigint           not null
#  overall_rating  :integer          not null
#  food_rating     :integer          not null
#  service_rating  :integer          not null
#  ambiance_rating :integer          not null
#  value_rating    :integer          not null
#  body            :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Review < ApplicationRecord
    validates :overall_rating, :food_rating, :service_rating, :ambiance_rating, :value_rating, presence: true
    validates :overall_rating, :food_rating, :service_rating, :ambiance_rating, :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :reservation_id, uniqueness: { message: "has already been reviewed" }
    validate :user_has_not_reviewed_restaurant_before

    belongs_to :reservation
    has_one :user, through: :reservation
    has_one :restaurant, through: :reservation

    private

    def user_has_not_reviewed_restaurant_before
        user = self.reservation.user
        restaurant = self.reservation.restaurant

        existing_review = Review.joins(:reservation)
                                .where(reservations: { user_id: user.id, restaurant_id: restaurant.id })
                                .where.not(id: self.id) # Exclude the current review if it's an update
                                .exists?

        errors.add(:base, "You have already reviewed this restaurant.") if existing_review
    end
end
