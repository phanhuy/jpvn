class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_test, except: [:index, :create]
  before_action :correct_user, except: [:index, :create]
  before_action :finished?, only: [:edit, :update]

  def index
    @tests = current_user.tests
      .paginate page: params[:page], per_page: 10
  end

  def create
    category = Category.find params[:category_id]
    @test = category.tests.build user: current_user
    if @test.save
      redirect_to @test
    else
      flash[:danger] = t "controllers.tests.create.flash_danger"
      redirect_to root_path
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @test.update_attributes test_params
      @test.mark = @test.user_answers.correct_answer.count
      @test.save
      user_log = UserLog.create(user_id: current_user.id,
                      log_data: "Finish a test in category " + params[:category])
      redirect_to @test
    else
      render :edit
    end
  end

  private
  def current_test
    if Test.exists?(params[:id])
      @test = Test.find params[:id]
    else
      redirect_to root_path
    end
  
    
  end

  def correct_user
    unless current_user == @test.user
      redirect_to root_path
    end
  end
  
  def test_params
    params.require(:test).permit :category, user_answers_attributes: [:id, :answer_id]
  end

  def finished?
    unless @test.mark.nil?
      flash[:danger] = t "controllers.tests.already_done"
      redirect_to tests_path
    end
  end
end
