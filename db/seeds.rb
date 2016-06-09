# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stephane = User.create(nom: 'stephane', email: 'stephane.dupuis.77650@gmail.com', password: 'test', role: 'admin')
laura = User.create(nom: 'laura', email: 'lauradupuis2005@gmail.com', password: 'test', role: 'editor')
alexis = User.create(nom: 'alexis', email: 'alexisdupuis2008@gmail.com', password: 'test', role: 'visitor')

