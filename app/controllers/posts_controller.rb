class PostsController < ApplicationController
before_action :set_post,only:[:show,:edit,:update,:destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice:"投稿しました"
    else
       @post = Post.new(post_params)
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"ツイート編集しました！"
    else
      @post = Post.new(post_params)
      render 'edit'
    end
  end

  def confirm
    @post = Post.new(post_params)
    render "new" if @post.invalid?
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'ツイートを削除しました！'
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
