class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :password, presence: true,  length: { minimum: 6 }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 10 }     
   end     

  ### Association
  has_many  :plans, dependent: :destroy
  has_one_attached :image
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_plans, through: :bookmarks, source: :plan

end
