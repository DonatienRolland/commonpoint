class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :point

  has_many :messages, dependent: :destroy

  has_many :equipments, dependent: :destroy
  accepts_nested_attributes_for :equipments

  accepts_nested_attributes_for :point, :reject_if => :all_blank, allow_destroy: true

  include PgSearch
  pg_search_scope :search_by_first_name,
    associated_against: {
      user: [ :first_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  private

  def validation_update(point_selected)
    return "Vous ne faites pas parti des participant" if self.point == point_selected
    return "Vous devez validez votre participation au Point avant" if self.status == "I'm in"
  end

end
