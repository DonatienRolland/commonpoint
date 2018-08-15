class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities
  has_many :activities, through: :user_activities
  accepts_nested_attributes_for :user_activities, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: :all_blank

  has_many :points
  accepts_nested_attributes_for :points, allow_destroy: true, reject_if: :all_blank

  def name
    name = self.email.first(8)
    name.capitalize
  end
end
