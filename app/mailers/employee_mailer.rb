class EmployeeMailer < ApplicationMailer
  
  def welcome_email(employee, email, password)
      @employee = employee
      @url  = 'http://www.gmail.com'
      @password = password
      mail(to: email,  subject: 'Welcome to My Awesome Site')
  end
end
