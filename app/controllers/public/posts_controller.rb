class Public::PostsController < Public::ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @nice = Nice.new
    @commentnew = Comment.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to public_post_path(@post.id)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to public_post_path(@post.id)
    else
      @posts = Post.all
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    flash[:notice] = "Comment was successfully destroyed."
    redirect_to public_posts_path(@post)
  end

  private

  def post_params
     params.require(:post).permit(:title, :body, :image)
  end
end

