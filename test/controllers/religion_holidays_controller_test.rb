require 'test_helper'

class ReligionHolidaysControllerTest < ActionController::TestCase
  setup do
    @religion_holiday = religion_holidays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:religion_holidays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create religion_holiday" do
    assert_difference('ReligionHoliday.count') do
      post :create, religion_holiday: { date: @religion_holiday.date, name: @religion_holiday.name, religion_id: @religion_holiday.religion_id }
    end

    assert_redirected_to religion_holiday_path(assigns(:religion_holiday))
  end

  test "should show religion_holiday" do
    get :show, id: @religion_holiday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @religion_holiday
    assert_response :success
  end

  test "should update religion_holiday" do
    patch :update, id: @religion_holiday, religion_holiday: { date: @religion_holiday.date, name: @religion_holiday.name, religion_id: @religion_holiday.religion_id }
    assert_redirected_to religion_holiday_path(assigns(:religion_holiday))
  end

  test "should destroy religion_holiday" do
    assert_difference('ReligionHoliday.count', -1) do
      delete :destroy, id: @religion_holiday
    end

    assert_redirected_to religion_holidays_path
  end
end
