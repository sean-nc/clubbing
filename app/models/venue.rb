class Venue < ApplicationRecord
  resourcify

  validates :name, presence: true
  validates :location, presence: true
  validates :age, presence: true
  validates :owner_id, presence: true

  belongs_to :owner, class_name: "User"
end
