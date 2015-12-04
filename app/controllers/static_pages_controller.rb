class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 6)
      
      
      @goals = current_user.goals
    
    
      #current goal:
      @goal = current_user.goals.where("deadline > ?",Time.now).first
      #byebug
      if @goal != nil
        @tests = current_user.tests.where("mark >= 0 and created_at > ? and created_at < ?",@goal.created_at,@goal.deadline).order('created_at ASC')
      end
      
    end
  end
end
