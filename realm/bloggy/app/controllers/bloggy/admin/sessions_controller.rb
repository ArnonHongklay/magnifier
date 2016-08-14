class Bloggy::Admin::SessionsController < Bloggy::Admin::BaseController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    user = Bloggy::User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:bloggy_user_id] = user.id
      redirect_to admin_url, notice: t("bloggy.admin.sessions.messages.logged_in")
    else
      flash.now.alert = t("bloggy.admin.sessions.messages.invalid")
      render "new"
    end
  end

  def destroy
    session[:bloggy_user_id] = nil
    redirect_to admin_url, notice: t("bloggy.admin.sessions.messages.logged_out")
  end
end
