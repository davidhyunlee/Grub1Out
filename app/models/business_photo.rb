class BusinessPhoto < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  belongs_to :review
end
