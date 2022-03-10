class AgendaItemsController < ApplicationController
  before_action :set_agenda_item, only: %i[show edit update destroy]

  def index
    @q = AgendaItem.ransack(params[:q])
    @agenda_items = @q.result(distinct: true).includes(:leader).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@agenda_items.where.not(location_latitude: nil)) do |agenda_item, marker|
      marker.lat agenda_item.location_latitude
      marker.lng agenda_item.location_longitude
    end
  end

  def show; end

  def new
    @agenda_item = AgendaItem.new
  end

  def edit; end

  def create
    @agenda_item = AgendaItem.new(agenda_item_params)

    if @agenda_item.save
      message = "AgendaItem was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @agenda_item, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @agenda_item.update(agenda_item_params)
      redirect_to @agenda_item, notice: "Agenda item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @agenda_item.destroy
    message = "AgendaItem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to agenda_items_url, notice: message
    end
  end

  private

  def set_agenda_item
    @agenda_item = AgendaItem.find(params[:id])
  end

  def agenda_item_params
    params.require(:agenda_item).permit(:start_time, :end_time, :location,
                                        :activity_name, :description, :photo, :leader_id, :is_cyoa, :budget_line_id)
  end
end
