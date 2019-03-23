# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: "Admin")
Role.create(name: "HR")
Role.create(name: "Employee")

Designation.create(name: "Web_Designer")
Designation.create(name: "Developer")
Designation.create(name: "Android_developer")
Designation.create(name: "IOS_Developer")
Designation.create(name: "BDE")
Designation.create(name: "HR")

LeaveType.create(name: "Sick_leave")
LeaveType.create(name: "Casual_leave")
LeaveType.create(name: "Earned_leave")
LeaveType.create(name: "Half_pay_leave")
LeaveType.create(name: "Maternity_leave")
LeaveType.create(name: "Quarantine_leave")


