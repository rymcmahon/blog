class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true
	validates :body, presence: true
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	attr_accessor :subtitle
  validates :subtitle, :invisible_captcha => true
end
