
class User < ApplicationRecord
  before_create :email_company

  validates :first_name, presence: true
  validates :last_name, presence: true
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  before_validation(on: :create) do
    self.email_company
    self.format_user_infos
  end
  before_save :format_user_infos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities
  accepts_nested_attributes_for :user_activities, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: :all_blank

  belongs_to :company
  accepts_nested_attributes_for :company, :reject_if => :all_blank

  has_many :points
  accepts_nested_attributes_for :points, allow_destroy: true, reject_if: :all_blank

  has_many :participants, dependent: :destroy
  has_many :points, through: :participants
  accepts_nested_attributes_for :participants, allow_destroy: true, reject_if: :all_blank


  def his_avatar
    init1 = self.first_name.split(//).first
    init2 = self.last_name.split(//).first
    init = init1 + init2
  end

  def format_user_infos
    self.first_name.capitalize!
    self.last_name.capitalize!
  end

  def is_participant?(current_point)
    participant = Participant.where(user: self, point: current_point)
    participant = participant.first
  end

  def participated?(current_point)
    participant = self.is_participant?(current_point)
    if participant.status == "I'm in"
      true
    else
      false
    end
  end

  def invited?(current_point)
    participant = self.is_participant?(current_point)
    if participant.invited
      return true
    else
      return false
    end
  end

  def is_owner?(current_point)
    current_point.user == self
  end

  def email_company
    if self.company.nil?
      user_domain = self.email.split("@").second
      comp = Company.where(email_domain: user_domain ).first
      self.company = comp
    else
      self.company
    end
  end

  def has_company?
    if self.company
      true
    end
  end
end
