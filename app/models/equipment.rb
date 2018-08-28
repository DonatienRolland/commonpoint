class Equipment < ApplicationRecord
  belongs_to :participant, optional: true
  belongs_to :point

  validates :title, presence: true
  validates_associated :point

  accepts_nested_attributes_for :point, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :participant

end
