class Location < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: { message: 'Not valid rss feed url' }
end
