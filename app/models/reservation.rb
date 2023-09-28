# == Schema Information
#
# Table name: reservations
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  restaurant_id :bigint           not null
#  party_size    :integer          not null
#  date          :date             not null
#  time          :time             not null
#  occasion      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Reservation < ApplicationRecord
    validates :user_id, :restaurant_id, :date, :time, presence: true
    validates :party_size, inclusion: { in: 1..11, message: "must be between 1 and 11" }, presence: true
    validate :validate_time_slot
    validate :date_cannot_be_in_the_past

    def validate_time_slot
        if time
            unless time.min % 30 == 0 && time >= "11:00:00" && time <= "22:00:00"
                errors.add(:time, "must be between 11:00 am and 10:00 pm and in 30-minute intervals")
            end
        end
    end

    def date_cannot_be_in_the_past
        if date && date < Date.today
            errors.add(:date, "can't be in the past")
        end
    end

end
