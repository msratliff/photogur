# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



post_list = [
  ["Panda", "Panda Panda Panda", "http://animals.sandiegozoo.org/sites/default/files/2016-09/animals_hero_panda.jpg", 3],
  ["Snake", "Snake Snake Snake", "https://i.ytimg.com/vi/n174VWdSlCE/maxresdefault.jpg", 1],
  ["Duck", "Duck Duck Duck", "https://greens.org.au/sites/greens.org.au/files/field/image/animals-duck-header.jpg", 3],
  ["Snake", "Snake Snake Snake", "https://i.ytimg.com/vi/n174VWdSlCE/maxresdefault.jpg", 1],
  ["Red Panda", "Red Panda Red Panda Red Panda", "https://ichef.bbci.co.uk/childrens-responsive-ichef-live/r/400/1x/cbbc/Animaltastic_Ambigous_Animals_Names_1024_576.jpg", 3],
  ["Orangutan", "Orangutan Orangutan Orangutan", "http://i.huffpost.com/gen/1755634/images/o-ANIMALS-PONDERING-facebook.jpg", 1],
  ["Zebra", "Zebra Zebra Zebra", "http://photos.mrkzy.com/wp-content/uploads/photos-mrkzy-animal-19183.jpg", 3]

  
]

post_list.each do |name, description, url, user_id|
  Post.find_or_create_by( name: name, description: description, url: url, user_id: user_id)
end
