class UserActivity < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, :reject_if => :all_blank

  belongs_to :activity, foreign_key: :activity_id
  accepts_nested_attributes_for :activity, :reject_if => :all_blank

  has_many :points
  accepts_nested_attributes_for :points, allow_destroy: true, reject_if: :all_blank


end
