class LikesController < ApplicationController
    before_action :find_post

    def create
        @post = find_post
        @post.likes += 1
        @post.save
        puts @post.likes
        redirect_to post_path(@post)
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end  
end
