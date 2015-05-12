class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  validates :body, presence: true
  validates :title, presence: true, length: { maximum: 70 }
end
