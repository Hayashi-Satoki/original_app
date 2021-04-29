class Picture < ApplicationRecord
  validates :description, presence: true
  validates :family_id, presence: true
  belongs_to :user
  has_many :comments
end
