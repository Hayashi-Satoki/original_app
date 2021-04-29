class Picture < ApplicationRecord
  validates :description, presence: true
  validates :family_id, presence: true
end
