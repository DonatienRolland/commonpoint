class UserActivity < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, :reject_if => :all_blank

  belongs_to :activity
  accepts_nested_attributes_for :activity, :reject_if => :all_blank

  scope :by_activity_title, -> (current_title) { joins(:activity).merge(Activity.by_title(current_title)) }

  has_one :categories, through: :activity

  has_many :points, dependent: :destroy
  accepts_nested_attributes_for :points, reject_if: :all_blank


end
