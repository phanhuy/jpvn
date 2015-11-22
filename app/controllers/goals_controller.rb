class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals
    
    
    #current goal:
    @goal = current_user.goals.where("deadline > ?",Time.now).first
    #byebug
    if @goal != nil
      @tests = current_user.tests.where("mark >= 0 and created_at > ? and created_at < ?",@goal.created_at,@goal.deadline).order('created_at ASC')
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = current_user.goals.where("deadline > ?",Time.now).first
    #byebug
    if @goal != nil
      @tests = current_user.tests.where("mark >= 0 and created_at > ? and created_at < ?",@goal.created_at,@goal.deadline).order('created_at ASC')
    end
  end

  # GET /goals/new
  def new
    @goal = Goal.new
    
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.current_average_score = 0.0
    @goal.current_test_done = 0
    @goal.test_cancelled = 0
    @user_logs = UserLog.new
    @user_logs.user_id = current_user.id
    @user_logs.log_data = "Creat new goal."
    @user_logs.save
    StudyLog.create(user_id: current_user.id,content: @goal.name+"という目標を作りました。")
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @user_logs = UserLog.new
    @user_logs.user_id = current_user.id
    @user_logs.log_data = "Updated a goal."
    @user_logs.save
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @user_logs = UserLog.new
    @user_logs.user_id = current_user.id
    @user_logs.log_data = "Destroyed a goal."
    @user_logs.save
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: "Goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :average_score, :deadline, :test_done)
    end
end
