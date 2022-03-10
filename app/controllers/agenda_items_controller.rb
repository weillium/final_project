class AgendaItemsController < ApplicationController
  before_action :set_agenda_item, only: %i[show edit update destroy]

  # GET /agenda_items
  def index
    @q = AgendaItem.ransack(params[:q])
    @agenda_items = @q.result(distinct: true).includes(:leader, :photos,
                                                       :budget_line).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@agenda_items.where.not(location_latitude: nil)) do |agenda_item, marker|
      marker.lat agenda_item.location_latitude
      marker.lng agenda_item.location_longitude
      marker.infowindow "<h5><a href='/agenda_items/#{agenda_item.id}'>#{agenda_item.start_time}</a></h5><small>#{agenda_item.location_formatted_address}</small>"
    end
  end

  # GET /agenda_items/1
  def show
    @photo = Photo.new
  end

  # GET /agenda_items/new
  def new
    @agenda_item = AgendaItem.new
  end

  # GET /agenda_items/1/edit
  def edit; end

  # POST /agenda_items
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

  # PATCH/PUT /agenda_items/1
  def update
    if @agenda_item.update(agenda_item_params)
      redirect_to @agenda_item, notice: "Agenda item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /agenda_items/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_agenda_item
    @agenda_item = AgendaItem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def agenda_item_params
    params.require(:agenda_item).permit(:start_time, :end_time, :location,
                                        :activity_name, :description, :photo, :leader_id, :is_cyoa, :budget_line_id)
  end
end
