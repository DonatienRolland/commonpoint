class Activity < ApplicationRecord
  belongs_to :category

  has_one :user_activity, dependent: :destroy
  has_many :users, through: :user_activities

end
