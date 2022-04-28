class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :lockable

  belongs_to :typical_build_usage
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, format: { with: /\d{1,5}\s\w.\s(\b\w*\b\s){1,2}\w*\./ },
   presence: true
  validates :city, presence: true
  validates :state, length: { is: 2 }, presence: true
  validates :zipcode, numericality: { only_integer: true }, length: { is: 5 }, presence: true
  validates :rgb_preference, inclusion: [1, 0], presence: true
  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :phone_number, format: { with: /\(\d{3}\)(\d{3})\-(\d{4})/ },
   presence: true
end
