class Article < ActiveRecord::Base
	has_and_belongs_to_many :categoires 
	validates :title, presence: true
	validates :text, presence: true
end
