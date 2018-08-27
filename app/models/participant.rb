class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :point

  accepts_nested_attributes_for :point, :reject_if => :all_blank

  # after_validation :status_validation

  private

  def status_validation
    if self.status == "" || self.status = nil?
      self.status = false
    end
  end

end
