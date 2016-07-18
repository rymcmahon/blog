class Message < ActiveRecord::Base
  validates :name, :email, :text, presence: true
end
