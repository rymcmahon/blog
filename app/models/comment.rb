class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true, :on => :create
	validates :body, presence: true, :on => :create
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, :on => :create
	attr_accessor :subtitle
  validates :subtitle, :invisible_captcha => true

  scope :approved, -> { where(approved: true) }
end
