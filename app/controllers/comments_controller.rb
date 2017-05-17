class CommentsController < ApplicationController

  def create
    unless logged_in?
      response_not_login
    else
      unless params[:check_login]
        @comment = current_user.comments.build comment_params
        if @comment.save
          render json: {
            html_comment: render_to_string(partial: "/comments/comment",
              locals: {comment: @comment},
              layout: false
            )
          }, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      delete_comment_success @comment.id
    else
      render_error @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :product_id
  end
end
