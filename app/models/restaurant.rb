# == Schema Information
#
# Table name: restaurants
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  description  :text             not null
#  cuisine      :string           not null
#  expense      :string           not null
#  price_range  :string           not null
#  neighborhood :string           not null
#  address      :string           not null
#  phone        :string           not null
#  website_url  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lat          :float            default(0.0), not null
#  long         :float            default(0.0), not null
#
class Restaurant < ApplicationRecord
    validates :name, :cuisine, :address, :website_url,
        length: { in: 2..255 }
    validates :description,
        length: { in: 3..30000 }
    validates :expense,
        inclusion: { in: %w($ $$ $$$ $$$$), message: "%{value} is not a valid expense" }
    validates :price_range, 
        inclusion: { in: ["$30 and under", "$31 to $50", "$50 and over"], message: "%{value} is not a valid price range" }
    validates :neighborhood,
        inclusion: { in: ["East Village", "Union Square", "Hell's Kitchen"], message: "%{value} is not a valid neighborhood" }
    validates :phone,
        length: { is: 14 }

    has_one_attached :photo
    has_many :reservations, dependent: :destroy
    has_many :reviews, through: :reservations
end
