class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true, :on => :create
	validates :body, presence: true, :on => :create
  validates :body, format: { with: /\A[a-zA-Z0-9]*\z/, message: "I only speak English" }
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, :on => :create
	attr_accessor :subtitle
  validates :subtitle, :invisible_captcha => true

  scope :approved, -> { where(approved: true) }
end
