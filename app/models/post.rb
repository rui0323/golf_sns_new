class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :customer
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy


    def get_image
    if images.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
       images
    end

    def favorited_by?(customer)
       favorites.exists?(customer_id: customer.id)
    end


   validates :title, presence: true
   validates :caption, presence: true
   validates :images, presence: true


end

