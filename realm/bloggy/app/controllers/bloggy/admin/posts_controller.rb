class Bloggy::Admin::PostsController < Bloggy::Admin::BaseController
  respond_to :html
  before_filter :load_post, only: [:edit, :update]

  def index
    @page = params[:page].nil? ? 1 : params[:page]
    @posts = Bloggy::Post.listing_page(@page).includes(:user)
  end

  def new
    @post = Bloggy::Post.new
  end

  ## Preview a post without saving.
  def preview
    # mockup our models for preview.
    @post = Bloggy::Post.new post_params
    @post.user_id = bloggy_current_user.id
    @post.published_at = Time.zone.now
    # render it exactly as it would display when live.
    render "/bloggy/posts/show", layout: Bloggy::Config.layout || "/layouts/bloggy/application"
  end

  def create
    @post = Bloggy::Post.new post_params
    @post.user_id = bloggy_current_user.id
    if @post.save
      prepare_flash_and_redirect_to_edit()
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      prepare_flash_and_redirect_to_edit()
    else
      render :edit
    end
  end

  def destroy
    post = Bloggy::Post.find(params[:id])
    if post.destroy
      redirect_to admin_posts_path, notice:  I18n.t("bloggy.admin.posts.delete.removed")
    else
      redirect_to admin_posts_path, alert: I18n.t("bloggy.admin.posts.delete.failed")
    end
  end

private
  def load_post
    @post = Bloggy::Post.find(params[:id])
  end

  def prepare_flash_and_redirect_to_edit
    if @post.published_in_future? && ActionController::Base.perform_caching
      flash[:warning] = I18n.t("bloggy.admin.posts.#{params[:action]}.saved_with_future_date_and_cache")
    else
      flash[:notice] =  I18n.t("bloggy.admin.posts.#{params[:action]}.saved")
    end
    redirect_to edit_admin_post_path(@post)
  end

  def post_params
    params.require(:post).permit(:published, :tag_list,:title,:content,:url,:published_at)
  end
end
