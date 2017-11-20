class ReligionHolidaysController < ApplicationController
  before_action :set_religion_holiday, only: [:show, :edit, :update, :destroy]

  # GET /religion_holidays
  # GET /religion_holidays.json
  def index
    @religion_holidays = ReligionHoliday.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /religion_holidays/1
  # GET /religion_holidays/1.json
  def show
  end

  # GET /religion_holidays/new
  def new
    @religion_holiday = ReligionHoliday.new
  end

  # GET /religion_holidays/1/edit
  def edit
  end

  # POST /religion_holidays
  # POST /religion_holidays.json
  def create
    @religion_holiday = ReligionHoliday.new(religion_holiday_params)

    respond_to do |format|
      if @religion_holiday.save
        format.html { redirect_to @religion_holiday, notice: 'Religion holiday was successfully created.' }
        format.json { render :show, status: :created, location: @religion_holiday }
      else
        format.html { render :new }
        format.json { render json: @religion_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /religion_holidays/1
  # PATCH/PUT /religion_holidays/1.json
  def update
    respond_to do |format|
      if @religion_holiday.update(religion_holiday_params)
        format.html { redirect_to @religion_holiday, notice: 'Religion holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @religion_holiday }
      else
        format.html { render :edit }
        format.json { render json: @religion_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /religion_holidays/1
  # DELETE /religion_holidays/1.json
  def destroy
    @religion_holiday.destroy
    respond_to do |format|
      format.html { redirect_to religion_holidays_url, notice: 'Religion holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religion_holiday
      @religion_holiday = ReligionHoliday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def religion_holiday_params
      params.require(:religion_holiday).permit(:name, :date, :religion_id)
    end
end
