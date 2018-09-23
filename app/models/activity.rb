class Activity < ApplicationRecord
  belongs_to :category, dependent: :destroy

  has_many :user_activity, dependent: :destroy
  has_many :users, through: :user_activities

  has_many :points, through: :user_activities

  scope :by_title, -> (current_title) { where(title: current_title ) }

  include PgSearch
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


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
