class Profile < ApplicationRecord
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :date_of_birth, presence: :true
  validates :gender, presence: :true,
            inclusion: { in: %w(Male Female) , message: "%{value} is not a valid gender" }
  validate :validate_age

  belongs_to :user, dependent: :destroy

  def validate_age
    if date_of_birth.present? && date_of_birth > Date.today - 19.years
      errors.add(:base, "Sorry, you are not old enough to sign up.")
    end
  end
end
