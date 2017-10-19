class NationalHolidaysController < ApplicationController
  before_action :set_national_holiday, only: [:show, :edit, :update, :destroy]

  # GET /national_holidays
  # GET /national_holidays.json
  def index
    @national_holidays = NationalHoliday.all
  end

  # GET /national_holidays/1
  # GET /national_holidays/1.json
  def show
  end

  # GET /national_holidays/new
  def new
    @national_holiday = NationalHoliday.new
  end

  # GET /national_holidays/1/edit
  def edit
  end

  # POST /national_holidays
  # POST /national_holidays.json
  def create
    @national_holiday = NationalHoliday.new(national_holiday_params)

    respond_to do |format|
      if @national_holiday.save
        format.html { redirect_to @national_holiday, notice: 'National holiday was successfully created.' }
        format.json { render :show, status: :created, location: @national_holiday }
      else
        format.html { render :new }
        format.json { render json: @national_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /national_holidays/1
  # PATCH/PUT /national_holidays/1.json
  def update
    respond_to do |format|
      if @national_holiday.update(national_holiday_params)
        format.html { redirect_to @national_holiday, notice: 'National holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @national_holiday }
      else
        format.html { render :edit }
        format.json { render json: @national_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /national_holidays/1
  # DELETE /national_holidays/1.json
  def destroy
    @national_holiday.destroy
    respond_to do |format|
      format.html { redirect_to national_holidays_url, notice: 'National holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_national_holiday
      @national_holiday = NationalHoliday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def national_holiday_params
      params.require(:national_holiday).permit(:name, :date, :nationality_id)
    end
end
