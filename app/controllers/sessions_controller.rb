class SessionsController < ApplicationController
    def index
        
    end

    def new

    end

    def create 
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            sesson[:user_id] = user.id
            flash[:success] = " You are logged in successfully"
            redirect_to root_path 
        else
            flash.now[:error] = "There is something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You are logged out successfully"
        redirect_to login_path
    end
end