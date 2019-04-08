class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable            
  has_many :addresses, dependent: :destroy
  has_many :leave_details, dependent: :destroy
  has_one :professional_detail, dependent: :destroy
  has_one :bank_detail, dependent: :destroy
  belongs_to :role
  belongs_to :designation

  # attr_accessor :email, :password, :password_confirmation, :role_attributes, :designation_attributes
  # accepts_nested_attributes_for :role, :designation
  accepts_nested_attributes_for :bank_detail
  accepts_nested_attributes_for :professional_detail
  accepts_nested_attributes_for :addresses
end
