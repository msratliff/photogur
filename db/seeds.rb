# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


i=0

while i < 50 do
	Post.find_or_create_by( name: "Bill Murray #{i}", description: "Knausgaard chia pok pok cardigan hammock. Skateboard church-key shoreditch williamsburg, pork belly iceland vexillologist man bun chia kale chips cronut direct trade meh biodiesel four loko. Before they sold out squid mumblecore, tilde raclette pitchfork man braid.", url: "https://www.fillmurray.com/#{rand(25..85)*10}/#{rand(25..85)*10}", user_id: rand(3))
	

  	n=0

	while n < 5 do
		Comment.find_or_create_by(content: "Trust fund quinoa lyft everyday carry man bun slow-carb lumbersexual fam squid. Cray hammock cred put a bird on it.", post_id: i, user_id: rand(3))
		n+=1
	end

	i+= 1

end
