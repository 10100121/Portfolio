class Public::CommentsController < Public::ApplicationController
  def create
	  @post = Post.find(params[:post_id])
	  @commentnew = current_user.comments.new(comment_params)
	  @commentnew.post_id = @post.id
	  if @commentnew.save
	    flash[:notice] = "Comment was successfully created."
	    redirect_to public_post_path(@post)
	  else
	  	@new = Post.new
	  	render template: "posts/show"
	  end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	    if @comment.update(comment_params)
	    flash[:notice] = "Comment was successfully update."
	    redirect_to public_post_path(@post.id)
	    else
	    render :edit
	    end
	end

	def destroy
		post = Post.find(params[:post_id])
	  	comment = Comment.find(params[:id])
	   	comment.destroy
	    flash[:notice] = "Comment was successfully destroyed."
	    redirect_to public_post_path(post)
	end

	private

	def comment_params
	    params.require(:comment).permit(:conversation)
	end

	def correct_user
	    comment = Comment.find(params[:id])
	    unless comment.user.id == current_user.id
	    redirect_to public_post_path
	    end
	end

end
