class EmployeeMailer < ApplicationMailer
  def welcome_email(employee, email)
     @employee = employee
      @url  = 'http://www.gmail.com'
      mail(to: email, subject: 'Welcome to My Awesome Site')
  end

  
end
