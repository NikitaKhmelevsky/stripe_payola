# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[:admin, :user].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end
admin = User.create(full_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
admin.add_role :admin

p1 = Plan.where(name: 'Platinum').first_or_initialize do |p|
  p.amount = 2900
  p.interval = 'month'
  p.stripe_id = 'platinum'
end
p1.save!(:validate => false)
p2 = Plan.where(name: 'Gold').first_or_initialize do |p|
  p.amount = 1900
  p.interval = 'month'
  p.stripe_id = 'gold'
end
p2.save!(:validate => false)
p3 = Plan.where(name: 'Silver').first_or_initialize do |p|
  p.amount = 900
  p.interval = 'month'
  p.stripe_id = 'silver'
end
p3.save!(:validate => false)
