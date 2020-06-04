class SessionsController < ApplicationController
    
def new
end

def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        redirect_to login_path
    end
end

def destroy
    session.delete(:user_id)
    redirect_to '/'
end


def omniauth
    @user = User.create_google_omniauth(auth)
    if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        redirect_to login_path
    end
end

def auth
    request.env['omniauth.auth']
end

end
