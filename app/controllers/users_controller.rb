class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]


    #register
    def create
        @user = User.create(user_param)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: {error: "Something wrong"}, status: :unprocessable_entity
        end
    end

    #login
    def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: "Invalid username or password"}, status: :ok
        end
    end

    def auto_login
        render json: @user
    end

    private

    def user_param
        params.permit(:username, :password, :email)
    end
end
