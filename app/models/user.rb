class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :blogs
    has_many :favorites, dependent: :destroy
    # current_user.blogs => []

    # blogs
    # id : 5
    # title 
    # content 
    # user_id: 2

    # users
    # id: 2
    # name 
    # email
    # pw

    # current_user.blogs
    # @blog = Blog.find(5)

    # @blog.user => user {id:2, name: "test_user", email: "test@test.com", ~~~~}

end