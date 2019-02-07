class Link < ApplicationRecord
	validates :title, presence: true
	validates :url, presence: true
	belongs_to :user
	has_many :votes

	def upvote(user)
		@vote = votes.new(vote_value: 1, user: user)
		@vote.save
	end 

	def downvote(user)
		@vote = votes.new(vote_value: -1, user: user)
		@vote.save
	end

	def upvotes
		votes.where(vote_value: 1).count
	end

	def downvotes
		votes.where(vote_value: -1).count
	end

	def total_score
		votes.sum(:vote_value)
	end



end
