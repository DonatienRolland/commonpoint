class Activity < ApplicationRecord
  mount_uploader :icon, PhotoUploader

  belongs_to :category

  has_many :user_activities, dependent: :destroy

  has_many :users, through: :user_activities

  has_many :points, through: :user_activities

  scope :by_title, -> (current_title) { where(title: current_title ) }

  include PgSearch
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def icon2
    if self.icon_url.nil?
      "http://res.cloudinary.com/dj7bq8py7/image/upload/v1539004535/nhxgdi9bxwakkz1mth8z.jpg"
    else
      self.icon
    end
  end
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
