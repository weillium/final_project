class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(distinct: true).includes(:taggee,
                                               :photo).page(params[:page]).per(10)
  end

  def show; end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      message = "Tag was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @tag, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    message = "Tag was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to tags_url, notice: message
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:photo_id, :tagged_id)
  end
end
