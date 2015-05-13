class Menu < ActiveRecord::Base
  belongs_to :business
  has_many :menu_item_categories
  has_many :menu_items, through: :menu_item_categories

   #adding picture uploading and likes dislikes
   mount_uploader :picture, PictureUploader
    validate :picture_size
    default_scope -> { order(updated_at: :desc)}

    def thumbs_up_total
        self.likes.where(like: true).size
    end

    def thumbs_down_total
        self.likes.where(like: false).size
    end

    private
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
        end
    end

  def self.pussy
    puts "your pussy is mine."
  end
end
