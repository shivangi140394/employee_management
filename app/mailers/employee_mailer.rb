class EmployeeMailer < ApplicationMailer

  def welcome_email(employee)
     @employee = employee
      @url  = 'http://www.gmail.com'
      mail(to: @employee.email, subject: 'Welcome to My Awesome Site')
  end
end
