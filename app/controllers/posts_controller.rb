class PostsController < ApplicationController
    before_action :authorized

    def create
        @post = Post.create(post_param)
        @post.users_id = @user.id
        if @post.save
            render json: {post: @post}, status: :created
        else
            render json: {error: "Something wrong"}, status: :unprocessable_entity
        end
    end


    private

    def post_param
        params.permit(:captions, :photo_url)
    end
end
