require 'test_helper'

class StudentRightsControllerTest < ActionController::TestCase
  setup do
    @student_right = student_rights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_rights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_right" do
    assert_difference('StudentRight.count') do
      post :create, student_right: { age: @student_right.age, country_id: @student_right.country_id, edu_level: @student_right.edu_level, nationality_id: @student_right.nationality_id, payment: @student_right.payment, religion_id: @student_right.religion_id, sex: @student_right.sex, speciality_id: @student_right.speciality_id }
    end

    assert_redirected_to student_right_path(assigns(:student_right))
  end

  test "should show student_right" do
    get :show, id: @student_right
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_right
    assert_response :success
  end

  test "should update student_right" do
    patch :update, id: @student_right, student_right: { age: @student_right.age, country_id: @student_right.country_id, edu_level: @student_right.edu_level, nationality_id: @student_right.nationality_id, payment: @student_right.payment, religion_id: @student_right.religion_id, sex: @student_right.sex, speciality_id: @student_right.speciality_id }
    assert_redirected_to student_right_path(assigns(:student_right))
  end

  test "should destroy student_right" do
    assert_difference('StudentRight.count', -1) do
      delete :destroy, id: @student_right
    end

    assert_redirected_to student_rights_path
  end
end
