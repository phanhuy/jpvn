class UsersController < ApplicationController
  def index
    #@users = User.paginate(page: params[:page])
    #@users = User.search(params[:search])
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page]).order("created_at DESC")
    else
      @users = User.paginate(page: params[:page]).order('created_at DESC')
      #@users = User.all.order('created_at DESC')
    end
  end
  
  def show
    @user = User.find(params[:id])
    @study_logs = @user.study_logs.paginate(page: params[:page])
    @is_me = @user.id == current_user.id ? true : false
    if !@is_me
            @status = current_user.status_with @user.id
            @friend = Friend.where(user_id: current_user.id, friend_id: @user.id).try(:first) ||
                Friend.where(user_id: @user.id, friend_id: current_user.id).try(:first)
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
