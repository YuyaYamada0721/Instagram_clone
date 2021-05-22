class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy ]
  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
      @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    if logged_in?
      @favorite = current_user.favorites.find_by(user_id: @user_id)
    else
      record_to new_user_path, notice: 'ログインが必要です'
    end
  end

  def new
    @blog = Blog.new
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def edit; end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to blogs_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: '投稿を削除しました'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:image, :image_cache, :content, :user_id)
  end
end
