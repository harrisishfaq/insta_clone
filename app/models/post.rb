class Post < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    has_many_attached :post_images, dependent: :destroy
end
