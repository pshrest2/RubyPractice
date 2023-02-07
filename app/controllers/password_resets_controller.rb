class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            # Send email
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to password_reset_path, :flash => { :success => "If an account with that email was found, we have sent a link to reset your password." }
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "reset_password")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to login_path, :flash => { :warning => "Your token has expired. Please try again." }
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "reset_password")
        if @user.update(password_params)
            redirect_to login_path, :flash => { :success => "Your password was reset successfully." }
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end