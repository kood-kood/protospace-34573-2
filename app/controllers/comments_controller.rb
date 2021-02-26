class CommentsController < ApplicationController

  def create
    # Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show" # views/prototypes/show.html.erbのファイルを参照しています。
    end
  end
  #   if Comment.create(comment_params)
  #     redirect_to "/prototypes/#{comment.prototype.id}"
  #   else
  #     render :show
  #   end
  # end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    # params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end


end
