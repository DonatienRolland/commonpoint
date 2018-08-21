class Point < ApplicationRecord
  belongs_to :user
  belongs_to :user_activity
  has_many :activities, through: :user_activity

  accepts_nested_attributes_for :user, :reject_if => :all_blank
  accepts_nested_attributes_for :user_activity, :reject_if => :all_blank

  validates :price, :address, :number_min, presence: true
  validates_associated :user_activity

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
)
