require 'test_helper'

class StudentLeftsControllerTest < ActionController::TestCase
  setup do
    @student_left = student_lefts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_lefts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_left" do
    assert_difference('StudentLeft.count') do
      post :create, student_left: { age: @student_left.age, country_id: @student_left.country_id, edu_level: @student_left.edu_level, nationality_id: @student_left.nationality_id, payment: @student_left.payment, religion_id: @student_left.religion_id, sex: @student_left.sex, speciality_id: @student_left.speciality_id }
    end

    assert_redirected_to student_left_path(assigns(:student_left))
  end

  test "should show student_left" do
    get :show, id: @student_left
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_left
    assert_response :success
  end

  test "should update student_left" do
    patch :update, id: @student_left, student_left: { age: @student_left.age, country_id: @student_left.country_id, edu_level: @student_left.edu_level, nationality_id: @student_left.nationality_id, payment: @student_left.payment, religion_id: @student_left.religion_id, sex: @student_left.sex, speciality_id: @student_left.speciality_id }
    assert_redirected_to student_left_path(assigns(:student_left))
  end

  test "should destroy student_left" do
    assert_difference('StudentLeft.count', -1) do
      delete :destroy, id: @student_left
    end

    assert_redirected_to student_lefts_path
  end
end
