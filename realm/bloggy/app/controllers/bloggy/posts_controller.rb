class Bloggy::PostsController < Bloggy::ApplicationController
  def index
    @page = params[:page].nil? ? 1 : params[:page]
    @posts = Bloggy::Post.page(@page).includes(:user).published
    # binding.pry
  end

  def show
    if bloggy_current_user
      @post = Bloggy::Post.default.where("url = :url", {url: params[:post_url]}).first
    else
      @post = Bloggy::Post.published.where("url = :url", {url: params[:post_url]}).first
    end
    if @post.nil?
      not_found
    end
  end

  def feed
    @posts = Bloggy::Post.published.limit(25)
    if params[:tags].present?
      tags = Bloggy::Tag.where(name: params[:tags].split(",")).pluck(:id)
      @posts = @posts.joins(:taggings).where("bloggy_taggings.tag_id in (?)", tags)
    end
    render 'feed', layout: false
  end
end
