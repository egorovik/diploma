require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { bday: @student.bday, country_id: @student.country_id, finish_date: @student.finish_date, fn: @student.fn, group_id: @student.group_id, ln: @student.ln, nationality_id: @student.nationality_id, passport_id: @student.passport_id, religion_id: @student.religion_id, room_id: @student.room_id, sex: @student.sex, sn: @student.sn, start_date: @student.start_date }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { bday: @student.bday, country_id: @student.country_id, finish_date: @student.finish_date, fn: @student.fn, group_id: @student.group_id, ln: @student.ln, nationality_id: @student.nationality_id, passport_id: @student.passport_id, religion_id: @student.religion_id, room_id: @student.room_id, sex: @student.sex, sn: @student.sn, start_date: @student.start_date }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
