require 'test_helper'

class NationalHolidaysControllerTest < ActionController::TestCase
  setup do
    @national_holiday = national_holidays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:national_holidays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create national_holiday" do
    assert_difference('NationalHoliday.count') do
      post :create, national_holiday: { date: @national_holiday.date, name: @national_holiday.name, nationality_id: @national_holiday.nationality_id }
    end

    assert_redirected_to national_holiday_path(assigns(:national_holiday))
  end

  test "should show national_holiday" do
    get :show, id: @national_holiday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @national_holiday
    assert_response :success
  end

  test "should update national_holiday" do
    patch :update, id: @national_holiday, national_holiday: { date: @national_holiday.date, name: @national_holiday.name, nationality_id: @national_holiday.nationality_id }
    assert_redirected_to national_holiday_path(assigns(:national_holiday))
  end

  test "should destroy national_holiday" do
    assert_difference('NationalHoliday.count', -1) do
      delete :destroy, id: @national_holiday
    end

    assert_redirected_to national_holidays_path
  end
end
