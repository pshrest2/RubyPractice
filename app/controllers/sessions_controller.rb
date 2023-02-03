class SessionsController < ApplicationController
    def new
        if Current.user
            redirect_to root_path
        end
    end

    def create
        user = User.find_by(email: params[:email]) 
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, :flash => { :success => "Logged in successfully" }
        else
            flash.now[:warning] = "Email or password incorrect"
            render :new,  status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, :flash => { :success => "Logged out successfully" }
    end
end