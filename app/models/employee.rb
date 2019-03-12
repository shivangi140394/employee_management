class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable            
  has_many :addresses
  # has_one :professional_detail
  has_one :bank_detail
  belongs_to :role
  belongs_to :designation
end
