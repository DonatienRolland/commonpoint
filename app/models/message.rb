class Message < ApplicationRecord
  belongs_to :point
  belongs_to :participant
  validates :content, presence: true
end
