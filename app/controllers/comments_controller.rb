class CommentsController < ApplicationController
def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_params)
    redirect_to post_path(@post)
  end
 def index
 	@comment=Comment.all
 end
def post_params
	params.require(:comment).permit(:commenter,:body)
end
end
