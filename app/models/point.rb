class Point < ApplicationRecord
  belongs_to :user
  belongs_to :user_activity

  has_many :activities, through: :user_activity
  has_many :users, through: :user_activity

  has_many :participants, dependent: :destroy
  has_many :users, through: :participants

  has_many :equipments, dependent: :destroy

  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :equipments, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :participants, reject_if: proc { |attributes| attributes['status'].blank? }, allow_destroy: proc { |attributes| attributes['status'].blank? }
  accepts_nested_attributes_for :user_activity, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :users
  # ou
  # accepts_nested_attributes_for :user_activity, :participants, :users

  # validates :price, :address, :number_min, presence: true
  validates_associated :user_activity

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  # after_validation :geocode, if: :will_save_change_to_address?

  def verif_data
    if self.address.present? && self.price.present? && self.number_min > 0 && self.level_min.present?
      self.number_max = nil
      self.save
    else
      return false
    end
  end

  def send_error_message
    return "Vous devez sélectionner une adresse" if self.address.nil?
    return "Vous devez sélectionner un prix " if self.price.nil?
    return "Vous devez sélectionner un nombre minimum de participant " if self.number_min == 0
    return "Vous devez sélectionner un niveau minimum " if self.level_min.nil?
  end
end
