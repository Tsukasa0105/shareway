class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @way = Way.find(params[:way_id])
    @comment = @way.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできませんでした"
      redirect_to way_path(@way)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
