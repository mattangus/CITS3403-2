# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.create([
              {content: 'hello', format: 1,sender_id: 1, group_id:1 },
              {content: 'hello2', format: 1,sender_id: 2, group_id:1 }
              ])

Group.create([
                   {users: '1;2', name: 'first'}
               ])
