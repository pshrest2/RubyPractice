class PasswordController < ApplicationController
    before_action :require_user_logged_in!

    def new
    end
    
    def update
        if !Current.user.authenticate(password_params[:current_password])
            redirect_to password_path, :flash => { :danger => "Current password is invalid" }
        elsif password_params[:new_password] != password_params[:new_password_confirmation]
            redirect_to password_path, :flash => { :danger => "Passwords do not match" }
        elsif Current.user.update(:password => password_params[:new_password], :password_confirmation => password_params[:new_password_confirmation])
            redirect_to root_path, :flash => {:success => "Password updated"}
        else
            render :new
        end
    end

    private
    def password_params
        params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
    end
end
