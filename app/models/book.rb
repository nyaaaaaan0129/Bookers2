class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
    validates :body, presence: true, length:{ maximum: 200, message: '200文字以内です'}
end
