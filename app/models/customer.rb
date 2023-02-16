class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower


    def get_profile_image
    if image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
       image
    end

    # フォローしたときの処理
    def follow(customer_id)
      relationships.create(followed_id: customer_id)
    end
    # フォローを外すときの処理
    def unfollow(customer_id)
      relationships.find_by(followed_id: customer_id).destroy
    end
    # フォローしているか判定
    def following?(customer)
      followings.include?(customer)
    end

     # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

 

end
