class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_slug
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: {maximum: 50} 
  validates :username, presence: true, uniqueness: true

  def to_param
    slug
  end
  
  private

  def set_slug
    self.slug = username.parameterize
  end
end
