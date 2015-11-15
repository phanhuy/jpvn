require 'test_helper'

class StudyLogsControllerTest < ActionController::TestCase
  setup do
    @study_log = study_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_log" do
    assert_difference('StudyLog.count') do
      post :create, study_log: { learned_word: @study_log.learned_word, user_id: @study_log.user_id }
    end

    assert_redirected_to study_log_path(assigns(:study_log))
  end

  test "should show study_log" do
    get :show, id: @study_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_log
    assert_response :success
  end

  test "should update study_log" do
    patch :update, id: @study_log, study_log: { learned_word: @study_log.learned_word, user_id: @study_log.user_id }
    assert_redirected_to study_log_path(assigns(:study_log))
  end

  test "should destroy study_log" do
    assert_difference('StudyLog.count', -1) do
      delete :destroy, id: @study_log
    end

    assert_redirected_to study_logs_path
  end
end
