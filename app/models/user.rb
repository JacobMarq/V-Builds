class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :lockable

  belongs_to :typical_build_usage
  has_many :orders

  has_many :user_builds
  has_many :builds, through: :user_builds, source: :build

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true,
              format: { with: /\d{1,5}\s\w.\s(\b\w*\b\s){1,2}\w*\./ }
  validates :city, presence: true
  validates :state, length: { is: 2 }, presence: true
  validates :zipcode, presence: true,
              numericality: { only_integer: true }, length: { is: 5 }
  validates :rgb_preference, inclusion: [1, 0], presence: true
  validates :budget, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :phone_number, presence: true,
              format: { with: /\(\d{3}\)(\d{3})\-(\d{4})/ }
end
