require 'test_helper'

class SpecialitiesControllerTest < ActionController::TestCase
  setup do
    @speciality = specialities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speciality" do
    assert_difference('Speciality.count') do
      post :create, speciality: { edu_area_code: @speciality.edu_area_code, edu_prog_code: @speciality.edu_prog_code, group_name: @speciality.group_name, group_number: @speciality.group_number, name: @speciality.name, section_name: @speciality.section_name, section_number: @speciality.section_number, speciality_code: @speciality.speciality_code, subgroup_name: @speciality.subgroup_name, subgroup_number: @speciality.subgroup_number }
    end

    assert_redirected_to speciality_path(assigns(:speciality))
  end

  test "should show speciality" do
    get :show, id: @speciality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @speciality
    assert_response :success
  end

  test "should update speciality" do
    patch :update, id: @speciality, speciality: { edu_area_code: @speciality.edu_area_code, edu_prog_code: @speciality.edu_prog_code, group_name: @speciality.group_name, group_number: @speciality.group_number, name: @speciality.name, section_name: @speciality.section_name, section_number: @speciality.section_number, speciality_code: @speciality.speciality_code, subgroup_name: @speciality.subgroup_name, subgroup_number: @speciality.subgroup_number }
    assert_redirected_to speciality_path(assigns(:speciality))
  end

  test "should destroy speciality" do
    assert_difference('Speciality.count', -1) do
      delete :destroy, id: @speciality
    end

    assert_redirected_to specialities_path
  end
end
