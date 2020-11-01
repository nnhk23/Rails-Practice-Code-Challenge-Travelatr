class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def top_5_most_recent_post
        self.posts.max_by(5){|post| post.created_at}
    end

    def most_liked_post
        self.posts.max_by{|post| post.likes}
    end

    def average_age
        self.bloggers.map{|blogger| blogger.age }.sum/self.bloggers.count
    end
end
