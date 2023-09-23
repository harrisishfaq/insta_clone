class Post < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    has_many_attached :post_images, dependent: :destroy


    has_many :user_like_posts , dependent: :destroy
    has_many :users , through: :user_like_posts

    has_many :suggestions , as: :suggestionable
end
