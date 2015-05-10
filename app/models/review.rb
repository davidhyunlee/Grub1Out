class Review < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: , maximum: }
  belongs_to :business
  belongs_to :user
end
