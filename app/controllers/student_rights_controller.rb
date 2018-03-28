class StudentRightsController < ApplicationController
  before_action :set_student_right, only: [:show, :edit, :update, :destroy]

  # GET /student_rights
  # GET /student_rights.json
  def index
    @student_rights = StudentRight.all
  end

  # GET /student_rights/1
  # GET /student_rights/1.json
  def show
  end

  # GET /student_rights/new
  def new
    @student_right = StudentRight.new
  end

  # GET /student_rights/1/edit
  def edit
  end

  # POST /student_rights
  # POST /student_rights.json
  def create
    @student_right = StudentRight.new(student_right_params)

    respond_to do |format|
      if @student_right.save
        format.html { redirect_to @student_right, notice: 'Student right was successfully created.' }
        format.json { render :show, status: :created, location: @student_right }
      else
        format.html { render :new }
        format.json { render json: @student_right.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_rights/1
  # PATCH/PUT /student_rights/1.json
  def update
    respond_to do |format|
      if @student_right.update(student_right_params)
        format.html { redirect_to @student_right, notice: 'Student right was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_right }
      else
        format.html { render :edit }
        format.json { render json: @student_right.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_rights/1
  # DELETE /student_rights/1.json
  def destroy
    @student_right.destroy
    respond_to do |format|
      format.html { redirect_to student_rights_url, notice: 'Student right was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_right
      @student_right = StudentRight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_right_params
      params.require(:student_right).permit(:nationality_id, :religion_id, :country_id, :age, :speciality_id, :edu_level, :payment, :sex)
    end
end
