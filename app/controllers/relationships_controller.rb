class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    p following
    following.create_notification_follow!(current_user, following.follower_id)
    redirect_to request.referer || root_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer || root_path
  end

end
