class WelcomesController < ApplicationController
  before_action :set_welcome, only: %i[ show edit update destroy ]

  # GET /welcomes or /welcomes.json
  def index
    @welcomes = Welcome.all
  end

  # GET /welcomes/1 or /welcomes/1.json
  def show
  end

  # GET /welcomes/new
  def new
    @welcome = Welcome.new
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes or /welcomes.json
  def create
    @welcome = Welcome.new(welcome_params)

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to welcome_url(@welcome), notice: "Welcome was successfully created." }
        format.json { render :show, status: :created, location: @welcome }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /welcomes/1 or /welcomes/1.json
  def update
    respond_to do |format|
      if @welcome.update(welcome_params)
        format.html { redirect_to welcome_url(@welcome), notice: "Welcome was successfully updated." }
        format.json { render :show, status: :ok, location: @welcome }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1 or /welcomes/1.json
  def destroy
    @welcome.destroy

    respond_to do |format|
      format.html { redirect_to welcomes_url, notice: "Welcome was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def welcome_params
      params.fetch(:welcome, {})
    end
end
