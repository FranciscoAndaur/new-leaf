class ApplicationController < ActionController::Base
    before_action :authorize 
    helper_method :current_user
    protect_from_forgery with: :null_session

    def current_user
        User.find_by(id: session[:user_id])
    end

    def login_user(user)
        session[:user_id] = user.id
    end

    def logged_in?
        !!current_user
    end

    def authorize
        unless logged_in?
            flash[:notice] = "You must be logged in to see this page"
            redirect_to login_path
        end
    end

end
