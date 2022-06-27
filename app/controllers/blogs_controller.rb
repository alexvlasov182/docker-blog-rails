class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit]}, site_admin: :all
  layout 'blog'

  def index
    @blogs = if logged_in?(:site_admin)
               Blog.recent.page(params[:page]).per(5)
             else
               Blog.published.recent.page(params[:page]).per(5)
             end
    @page_title = 'My Portfolio Blog'
  end

  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new

      @page_title = @blog.title
      @page_title = @blog.body
    else
      redirect_to blogs_path, notice: 'You are not authorized to access this page'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: "Post status has been updated."
  end

  private
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
