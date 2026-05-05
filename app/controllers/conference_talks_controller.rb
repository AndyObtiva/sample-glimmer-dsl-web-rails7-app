class ConferenceTalksController < ApplicationController
  before_action :set_conference_talk, only: %i[ show edit update destroy ]

  # GET /conference_talks or /conference_talks.json
  def index
    @conference_talks = ConferenceTalk.all
  end

  # GET /conference_talks/1 or /conference_talks/1.json
  def show
  end

  # GET /conference_talks/new
  def new
    @conference_talk = ConferenceTalk.new
  end

  # GET /conference_talks/1/edit
  def edit
  end

  # POST /conference_talks or /conference_talks.json
  def create
    @conference_talk = ConferenceTalk.new(conference_talk_params)

    respond_to do |format|
      if @conference_talk.save
        format.html { redirect_to conference_talk_url(@conference_talk), notice: "Conference talk was successfully created." }
        format.json { render :show, status: :created, location: @conference_talk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conference_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conference_talks/1 or /conference_talks/1.json
  def update
    respond_to do |format|
      if @conference_talk.update(conference_talk_params)
        format.html { redirect_to conference_talk_url(@conference_talk), notice: "Conference talk was successfully updated." }
        format.json { render :show, status: :ok, location: @conference_talk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conference_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conference_talks/1 or /conference_talks/1.json
  def destroy
    @conference_talk.destroy

    respond_to do |format|
      format.html { redirect_to conference_talks_url, notice: "Conference talk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference_talk
      @conference_talk = ConferenceTalk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conference_talk_params
      params.require(:conference_talk).permit(:title, :speaker, :track, :description, :bio)
    end
end
