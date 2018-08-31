class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities
  has_many :activities, through: :user_activities
  accepts_nested_attributes_for :user_activities, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: :all_blank

  belongs_to :company
  accepts_nested_attributes_for :company, :reject_if => :all_blank

  has_many :points
  accepts_nested_attributes_for :points, allow_destroy: true, reject_if: :all_blank

  has_many :participants
  has_many :points, through: :participants
  accepts_nested_attributes_for :participants, allow_destroy: true, reject_if: :all_blank

  def name
    name = self.email.first(8)
    name.capitalize
  end

  def comming(current_point)
    array_participant = Participant.where(point: current_point, user: self)
    participant = array_participant.first
    if participant.status == "I'm in"
      return true
    elsif participant.status == "I can't"
      return false
    else
      return nil
    end
  end

  def is_participant?(current_point)
    participant = Participant.where(user: self, point: current_point)
    participant = participant.first
  end
  def partipated?(current_point)
    participant = self.is_participant?(current_point)
    participant.status == "I'm in"
  end
  def invated?(current_point)
    participant = self.is_participant?(current_point)
    participant.invited == true
  end
  def is_owner?(current_point)
    current_point.user == self
  end
end
