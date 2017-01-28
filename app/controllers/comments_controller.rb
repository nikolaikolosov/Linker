class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create

    @link = Link.find(params[:link_id])

    @c = @link.comments.new(comment_params)

    @c.user_id = current_user.id

    @c.save

    redirect_to link_path(@link)

  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params

      params.require(:comment).permit(:user_id, :body)

    end
end
