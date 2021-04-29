class Picture < ApplicationRecord
  validates :description, presence: true
  validates :family_id, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Picture.where('description LIKE(?)', "%#{search}%")
    else
      Picture.all
    end
  end

end
