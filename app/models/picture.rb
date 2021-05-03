class Picture < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :family
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :description, presence: true
  validates :family_id, numericality: { other_than: 1 }
  validates :image, presence: true


  def self.search(search)
    if search != ""
      Picture.where('description LIKE(?)', "%#{search}%")
    else
      Picture.all
    end
  end

end
