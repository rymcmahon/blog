class Article < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :text, presence: true
end
