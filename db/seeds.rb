# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'a@a', name: 'aaa', password: 'aaaaaa', profile_image_id: nil, birthday: '1990-1-1', introduction: '私の顔はない'},
    {email: 'b@b', name: 'bbb', password: 'bbbbbb', profile_image_id: nil, birthday: '1992-2-2', introduction: '私はRails'},
    {email: 'c@c', name: 'ccc', password: 'cccccc', profile_image_id: nil, birthday: '1993-3-3', introduction: '私は喫煙者'},
    {email: 'd@d', name: 'ddd', password: 'dddddd', profile_image_id: nil, birthday: '1994-4-4', introduction: '私は着物を着ています'}
  ]
)

Holiday.create!(
  [
    {content: '娘と一緒に遊びました', image_id: nil, user_id: users[0].id},
    {content: 'ファイト一発、あと少し', image_id: nil, user_id: users[1].id},
    {content: '海で寝すぎると日焼けします', image_id: nil, user_id: users[2].id},
    {content: 'この星でたった一つだけ', image_id: nil, user_id: users[3].id}
  ]
)