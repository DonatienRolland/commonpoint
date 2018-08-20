class Activity < ApplicationRecord
  belongs_to :category

  has_one :user_activity, dependent: :destroy
  has_many :users, through: :user_activities



  def is_category?(cat)
    if self.category == cat
      true
    end
  end

  def is_a_user_activity?(user)
    activities = []
    user.user_activities.each do |user_activity|
      activities << user_activity.activity
    end
    activities.include?(self)
  end

  def number_of_user
    UserActivity.where(activity: self).count
  end

  def best_activity?(numbers)
    if numbers.include?(number_of_user)
      true
    end
  end
end
