class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    has_many :likes, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def likes
        self.posts.map{|post| post.likes}.sum
    end

    def most_liked_post
        self.posts.max_by{|post| post.likes}
    end


end
