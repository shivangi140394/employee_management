class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :personal_email, :personal_password

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_many :leave_details,  dependent: :destroy
  has_one :professional_detail, dependent: :destroy
  has_one :bank_detail, dependent: :destroy
  belongs_to :role
  belongs_to :designation
 


  # attr_accessor :email, :password, :password_confirmation, :role_attributes, :designation_attributes
  # accepts_nested_attributes_for :role, :designation

 validates_uniqueness_of :email

  accepts_nested_attributes_for :bank_detail
  accepts_nested_attributes_for :professional_detail
  accepts_nested_attributes_for :address


  after_create :send_mail_to_employee

  def send_mail_to_employee
    EmployeeMailer.welcome_email(self, self.personal_email, self.personal_password ).deliver_now
  end

  def admin?
    role.name == 'admin'
  end

  def lead?
    role.name == 'lead'
  end

  def hr?
    role.name == 'hr'
  end

  def employee?
    role.name == 'employee'   
  end

end
