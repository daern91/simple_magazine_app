module ArticlesHelper

  def owner?
    current_user.id == Article.find(params[:id]).user_id if user_signed_in?
  end

end
