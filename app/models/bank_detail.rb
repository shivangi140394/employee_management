class BankDetail < ApplicationRecord
  belongs_to :employee

  validates :account_no, presence: true
  validates :bank_name, presence: true

  # validates_format_of :ifsc_code,:with => /^[A-Za-z]{4}0[A-Z0-9a-z]{6}$/, :multiline => true
end
