class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.build_passport
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: {content: 'Student was successfully created.', type: "success"} }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: {content: 'Student was successfully updated.', type: "success"} }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    begin
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_url, notice: {content: 'Студент удалён.', type: "success"} }
        format.json { head :no_content }
      end
    rescue ActiveRecord::InvalidForeignKey
      respond_to do |format|
        format.html { redirect_to students_url, notice: {content: 'На эту запись ссылаются другие таблицы', type: "danger"} }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:passport_id, :ln, :fn, :sn, :sex, :bday, :country_id, :nationality_id, :religion_id, :start_date, :finish_date, :group_id, :room_id,
                                      documents_attributes: [:id, :_destroy, :doc_type, :doc_number, :exp_date, :language, :translation],
                                      passport_attributes: [:id, :serial, :number, :passport_type, :language, :translation])
    end
end
