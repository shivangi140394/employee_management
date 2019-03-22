class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable            
  has_many :addresses
  has_one :professional_detail
  has_one :bank_detail
  belongs_to :role
  belongs_to :designation

  # attr_accessor :email, :password, :password_confirmation, :role_attributes, :designation_attributes
  # accepts_nested_attributes_for :role, :designation
  accepts_nested_attributes_for :bank_detail
end
