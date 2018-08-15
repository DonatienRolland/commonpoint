class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity, foreign_key: :activity_id
  accepts_nested_attributes_for :user, :reject_if => :all_blank
  accepts_nested_attributes_for :activity, :reject_if => :all_blank


end
