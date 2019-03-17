class Location < ApplicationRecord
  validates :url, presence: true
end
