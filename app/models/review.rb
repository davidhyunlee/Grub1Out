class Review < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: 30, maximum: 1000 }
  belongs_to :business
  belongs_to :user
  validates :title, presence: true, length: { maximum: 70 }
end
