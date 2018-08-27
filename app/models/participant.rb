class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :point

  has_many :equipments
  accepts_nested_attributes_for :equipments

  accepts_nested_attributes_for :point, :reject_if => :all_blank, allow_destroy: true

  private

end
