class RestrictionsController < ApplicationController
  before_action :set_restriction, only: [:show, :edit, :update, :destroy]

  # GET /restrictions
  # GET /restrictions.json
  def index
    @restrictions = Restriction.all
  end

  # GET /restrictions/1
  # GET /restrictions/1.json
  def show
  end

  # GET /restrictions/new
  def new
    @restriction = Restriction.new
    @restriction.build_student_left
    @restriction.build_student_right
  end

  # GET /restrictions/1/edit
  def edit
  end

  # POST /restrictions
  # POST /restrictions.json
  def create
    @restriction = Restriction.new(restriction_params)

    respond_to do |format|
      if @restriction.save
        format.html { redirect_to @restriction, notice: 'Restriction was successfully created.' }
        format.json { render :show, status: :created, location: @restriction }
      else
        format.html { render :new }
        format.json { render json: @restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restrictions/1
  # PATCH/PUT /restrictions/1.json
  def update
    respond_to do |format|
      if @restriction.update(restriction_params)
        format.html { redirect_to @restriction, notice: 'Restriction was successfully updated.' }
        format.json { render :show, status: :ok, location: @restriction }
      else
        format.html { render :edit }
        format.json { render json: @restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restrictions/1
  # DELETE /restrictions/1.json
  def destroy
    sl = @restriction.student_left
    sr = @restriction.student_right
    @restriction.destroy
    sl.destroy
    sr.destroy
    respond_to do |format|
      format.html { redirect_to restrictions_url, notice: 'Restriction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restriction
      @restriction = Restriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restriction_params
      params.require(:restriction).permit(:student_left_id, :student_right_id, :restriction_type, :same_room, :same_floor, :same_hostel, :same_group, :higher_floor, :lower_floor,
      student_left_attributes: [:id, :nationality_id, :religion_id, :country_id, :age, :speciality_id, :edu_level, :payment, :sex],
      student_right_attributes: [:id, :nationality_id, :religion_id, :country_id, :age, :speciality_id, :edu_level, :payment, :sex])
    end
end
