class Point < ApplicationRecord
  # after_create :destroy_if_blanck
  # methode pour aider les recherche
  scope :addresses, -> (address) { where address: address }
  # scope :full?, -> (full) { where full: full } changer avec true

  scope :dates, lambda { |date|
    after = date.split.first
    before = date.split.last
    where('DATE(date) >= ? AND DATE(date) <= ?', after.to_date, before.to_date)
  }

  scope :activity_title, -> (current_title) { joins(:user_activity).merge(UserActivity.by_activity_title(current_title)) }

  belongs_to :user, dependent: :destroy
  belongs_to :user_activity, dependent: :destroy
  belongs_to :point_group, required: false

  has_one :activity, through: :user_activity

  has_many :equipments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_activity

  has_many :participants, dependent: :destroy do
    def find_by_level(spe_level)
      participants = []
      self.each do |participant|
        if participant.user.user_activities.by_activity_title(participant.point.activity_title).where(level: spe_level).present?
          participants << participant
        end
      end
      return participants
    end
  end

  has_many :users, through: :participants

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
      if !self.number_max.nil? && self.number_max < self.number_min
        self.number_max = nil
      end
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

  def start_time
    self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def is_new?
    if self.created_at > Date.today - 1.hours
      true
    end
  end

  def activity_title
    self.activity.title
  end

  def is_public?
    if self.type_of_point == "Publique"
      true
    end
  end

  def destroy_if_blanck
    if self.date.nil? && self.address.nil?
      self.destroy
    end
  end

  def day_month
    self.date.strftime("%A %d %B %Y at %H:%M")
  end

  def is_full?
    if !self.number_max.nil?
      self.number_max == Participant.where(point: self, status: "I'm in").count
    else
      return false
    end
  end


end
