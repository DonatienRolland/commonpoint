class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :point

  has_many :messages, dependent: :destroy

  has_many :equipments, dependent: :destroy

  scope :invited_to, -> (point) { where( point: point, invited: true) }
  scope :is_comming_to, -> (point) { where( point: point, invited: true, status: "I'm in") }
  scope :order_by_user_name, -> { includes(:user).order('users.first_name')}


  accepts_nested_attributes_for :equipments

  # accepts_nested_attributes_for :point, :reject_if => :all_blank, allow_destroy: true

  include PgSearch
  pg_search_scope :search_by_first_name,
    associated_against: {
      user: [ :first_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def is_level(spe_level)
    if self.user.user_activities.by_activity_title(self.point.activity_title).where(level: spe_level).present?
      true
    end
  end

  private

  def validation_update(point_selected)
    return "Vous ne faites pas parti des participant" if self.point == point_selected
    return "Vous devez validez votre participation au Point avant" if self.status == "I'm in"
  end



end
