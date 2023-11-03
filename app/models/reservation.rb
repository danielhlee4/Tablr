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
    validate :no_overlapping_reservations

    belongs_to :user
    belongs_to :restaurant
    has_many :reviews, dependent: :destroy

    def validate_time_slot
        if time
            time_in_est = time.in_time_zone('Eastern Time (US & Canada)')
            start_time = Time.zone.parse("11:00:00")
            end_time = Time.zone.parse("22:00:00")
            # check if time of the reservation is between 11 am and 10 pm and is either on the hour or the half-hour.
            unless time_in_est.min % 30 == 0 && time_in_est.strftime('%H:%M:%S') >= start_time.strftime('%H:%M:%S') && time_in_est.strftime('%H:%M:%S') <= end_time.strftime('%H:%M:%S')
                errors.add(:time, "must be between 11:00 am and 10:00 pm and in 30-minute intervals")
            end
        end
    end

    def date_cannot_be_in_the_past
        if date && date < Date.today
            errors.add(:date, "can't be in the past")
        end
    end

    def no_overlapping_reservations
        # Extract only the time part of the datetime for an accurate comparison.
        time_only = self.time.strftime("%H:%M:%S")
      
        overlapping_reservations = Reservation.where(
          user_id: user_id,
          date: date
        ).where.not(id: id)
      
        overlapping_reservations.each do |reservation|
          if reservation.time.strftime("%H:%M:%S") == time_only
            errors.add(:base, "You already have a reservation at this time and date.")
            break
          end
        end
    end
end
