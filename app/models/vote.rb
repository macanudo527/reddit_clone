class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :link
	validates_inclusion_of :vote_value, in: [-1,1]
end
