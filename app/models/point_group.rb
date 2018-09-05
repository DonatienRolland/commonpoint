class PointGroup < ApplicationRecord
  has_many :points, dependent: :destroy
end
