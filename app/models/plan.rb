class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :place
    validates :category_id
    validates :timezone_id
    validates :season_id
    validates :image
    validates :time   
    validates :cost, numericality: { greater_than: 0, less_than: 10000000 },format: { with: /\A[0-9]+\z/ }
  end

  with_options length: { maximum: 1000 }, presence: true do
    validates :concept
    validates :item
    validates :process
  end
   
#Assosiation
  belongs_to  :category
  belongs_to  :timezone
  belongs_to  :season
  belongs_to  :user
  has_one_attached :image

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks, source: :user

  def was_attached?
    self.image.attached?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
