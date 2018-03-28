class StudentLeftsController < ApplicationController
  before_action :set_student_left, only: [:show, :edit, :update, :destroy]

  # GET /student_lefts
  # GET /student_lefts.json
  def index
    @student_lefts = StudentLeft.all
  end

  # GET /student_lefts/1
  # GET /student_lefts/1.json
  def show
  end

  # GET /student_lefts/new
  def new
    @student_left = StudentLeft.new
  end

  # GET /student_lefts/1/edit
  def edit
  end

  # POST /student_lefts
  # POST /student_lefts.json
  def create
    @student_left = StudentLeft.new(student_left_params)

    respond_to do |format|
      if @student_left.save
        format.html { redirect_to @student_left, notice: 'Student left was successfully created.' }
        format.json { render :show, status: :created, location: @student_left }
      else
        format.html { render :new }
        format.json { render json: @student_left.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_lefts/1
  # PATCH/PUT /student_lefts/1.json
  def update
    respond_to do |format|
      if @student_left.update(student_left_params)
        format.html { redirect_to @student_left, notice: 'Student left was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_left }
      else
        format.html { render :edit }
        format.json { render json: @student_left.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_lefts/1
  # DELETE /student_lefts/1.json
  def destroy
    @student_left.destroy
    respond_to do |format|
      format.html { redirect_to student_lefts_url, notice: 'Student left was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_left
      @student_left = StudentLeft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_left_params
      params.require(:student_left).permit(:nationality_id, :religion_id, :country_id, :age, :speciality_id, :edu_level, :payment, :sex)
    end
end
