class RelationshipsController < ApplicationController
  def create
    # user = User.find(following_id: params[:user_id])
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    # ⬇︎ボタンを押したコントローラとアクションを調べる
    # path = Rails.application.routes.recognize_path(request.referer)
    # ⬇︎ページを変えない
    redirect_to request.referrer || root_url
  end

  def destroy
    # user = User.find(following: params[:user_id])
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referrer || root_url
  end
end
