class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end 

    def user_params
        params.require(:user).permit(:name, :email)
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end 


    def show 
        user = User.find(params[:id])
        render json: user
    end 

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to users_url(user)
        else
            render user.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy 
        user = User.find_by(id: params[:id])
        if user && user.destroy
            redirect_to users_url(user)
        else
            render json: { 'error': "user doesnt exist" }, status: 404
        end
    end 

end
