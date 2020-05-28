class CommentsController < ApplicationController
  before_action :authenticate_user!

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.player.touch_by(current_user)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.player, notice: 'Comment was successfully added.' }
      else
        format.html { redirect_to @comment.player, alert: 'Something wrong happened.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id]).decorate
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(
        :content,
        :user_id,
        :player_id
      )
    end
end
