class RelationshipsController < ApplicationController

def create
  user = User.find(params[:user_id])
  if current_user.follow(user)
    redirect_to request.referer
  else
    raise "フォローに失敗しました！"
  end
end
  
def destroy
  relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
  relationship.destroy
  redirect_to request.referer
end

end


