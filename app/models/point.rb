class Point < ApplicationRecord
  belongs_to :user
  belongs_to :user_activity
  has_many :activities, through: :user_activity

  accepts_nested_attributes_for :user, :reject_if => :all_blank
  accepts_nested_attributes_for :user_activity, :reject_if => :all_blank
end
