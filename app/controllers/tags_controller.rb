class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(:distinct => true).includes(:taggee, :photo).page(params[:page]).per(10)
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      message = 'Tag was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @tag, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    message = "Tag was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to tags_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:photo_id, :tagged_id)
    end
end
