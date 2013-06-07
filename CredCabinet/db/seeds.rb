# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Adding new credentials"
Credential.create [
  {
    title: "PE License", 
    issuing_authority: "New York State", 
    date_issued: 2011,
    last_renewal: 0000,
    next_renewal: 2013,
    credential_image: "Image" 
  },
  {
   	title: "PE License", 
    issuing_authority: "California", 
    date_issued: 2010,
    last_renewal: 2012,
    next_renewal: 2014,
    credential_image: "Image"
  },
  {
    title: "PE License", 
    issuing_authority: "New York State", 
    date_issued: 2011,
    last_renewal: 0000,
    next_renewal: 2013,
    credential_image: "Image"
  }]