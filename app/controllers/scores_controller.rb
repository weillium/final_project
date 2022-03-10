class ScoresController < ApplicationController
  before_action :set_score, only: %i[show edit update destroy]

  # GET /scores
  def index
    @q = Score.ransack(params[:q])
    @scores = @q.result(distinct: true).includes(:family).page(params[:page]).per(10)
  end

  # GET /scores/1
  def show; end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit; end

  # POST /scores
  def create
    @score = Score.new(score_params)

    if @score.save
      message = "Score was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @score, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      redirect_to @score, notice: "Score was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy
    message = "Score was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to scores_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_score
    @score = Score.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def score_params
    params.require(:score).permit(:family_id, :score, :description)
  end
end
