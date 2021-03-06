class PassportsController < ApplicationController
  before_action :set_passport, only: [:show, :edit, :update, :destroy]

  # GET /passports
  # GET /passports.json
  def index
    @passports = Passport.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /passports/1
  # GET /passports/1.json
  def show
  end

  # GET /passports/new
  def new
    @passport = Passport.new
  end

  # GET /passports/1/edit
  def edit
  end

  # POST /passports
  # POST /passports.json
  def create
    @passport = Passport.new(passport_params)

    respond_to do |format|
      if @passport.save
        format.html { redirect_to @passport, notice: 'Passport was successfully created.' }
        format.json { render :show, status: :created, location: @passport }
      else
        format.html { render :new }
        format.json { render json: @passport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passports/1
  # PATCH/PUT /passports/1.json
  def update
    respond_to do |format|
      if @passport.update(passport_params)
        format.html { redirect_to @passport, notice: 'Passport was successfully updated.' }
        format.json { render :show, status: :ok, location: @passport }
      else
        format.html { render :edit }
        format.json { render json: @passport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passports/1
  # DELETE /passports/1.json
  def destroy
    @passport.destroy
    respond_to do |format|
      format.html { redirect_to passports_url, notice: 'Passport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passport
      @passport = Passport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passport_params
      params.require(:passport).permit(:serial, :number, :passport_type, :language, :translation)
    end
end
