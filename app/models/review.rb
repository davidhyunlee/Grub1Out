class Review < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: , maximum: }
  belongs_to :business
  belongs_to :user
  validates :body, presence: true
  validates :title, presence: true, length: { maximum: 70 }
end
