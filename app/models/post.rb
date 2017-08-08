class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :taggings, dependent: :delete_all
	has_many :tags, through: :taggings

	
	# Next & Previous Buttons

	def previous
	  Post.where(["id < ?", id]).last
	end

	def next
	  Post.where(["id > ?", id]).first
	end



	#Tagging Links

	def self.tagged_with(name)
		Tag.find_by_name!(name).posts
	end

	def self.tag_counts
		Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end

end
