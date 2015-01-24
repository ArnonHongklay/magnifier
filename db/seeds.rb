# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Account.new(email: 'geek@ohmpieng.io', password: '87654321', password_confirmation: '87654321', name: "geek")
user.admin = true
user.confirmed_at = Time.now
user.save

user = Account.new(email: 'test@ohmpieng.io', password: '12345678', password_confirmation: '12345678', name: "test")
user.confirmed_at = Time.now
user.save
