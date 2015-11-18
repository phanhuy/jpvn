class StudyLogsController < ApplicationController
  before_action :set_study_log, only: [:show, :edit, :update, :destroy]

  # GET /study_logs
  # GET /study_logs.json
  def index
    #@study_logs = StudyLog.all
    @study_logs = current_user.study_logs.all
    #@groups_for_chart = @study_logs.to_a.group_by{|x| x.created_at.beginning_of_day}.map{|group| [group[0].strftime("%F"), group[1].map(&:learned_word).sum]}
    #@groups_for_chart = [[2015-11-06,20],[2015-11-05,25],[2015-11-03,10]]
    @groups_for_chart = [[2015-11-15,100],[2015-11-01,0]]
  end

  # GET /study_logs/1
  # GET /study_logs/1.json
  def show
  end

  # GET /study_logs/new
  def new
    @study_log = StudyLog.new
  end

  # GET /study_logs/1/edit
  def edit
  end

  # POST /study_logs
  # POST /study_logs.json
  def create
    @study_log = StudyLog.new(study_log_params)

    respond_to do |format|
      if @study_log.save
        format.html { redirect_to @study_log, notice: 'Study log was successfully created.' }
        format.json { render :show, status: :created, location: @study_log }
      else
        format.html { render :new }
        format.json { render json: @study_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_logs/1
  # PATCH/PUT /study_logs/1.json
  def update
    respond_to do |format|
      if @study_log.update(study_log_params)
        format.html { redirect_to @study_log, notice: 'Study log was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_log }
      else
        format.html { render :edit }
        format.json { render json: @study_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_logs/1
  # DELETE /study_logs/1.json
  def destroy
    @study_log.destroy
    respond_to do |format|
      format.html { redirect_to study_logs_url, notice: 'Study log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_log
      @study_log = StudyLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_log_params
      params.require(:study_log).permit(:user_id, :learned_word)
    end
end
