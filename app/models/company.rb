class Company < ApplicationRecord
  has_many :users
  accepts_nested_attributes_for :users, allow_destroy: true, reject_if: :all_blank

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
