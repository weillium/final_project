class AgendaItemsController < ApplicationController
  before_action :set_agenda_item, only: [:show, :edit, :update, :destroy]

  # GET /agenda_items
  def index
    @agenda_items = AgendaItem.all
  end

  # GET /agenda_items/1
  def show
  end

  # GET /agenda_items/new
  def new
    @agenda_item = AgendaItem.new
  end

  # GET /agenda_items/1/edit
  def edit
  end

  # POST /agenda_items
  def create
    @agenda_item = AgendaItem.new(agenda_item_params)

    if @agenda_item.save
      redirect_to @agenda_item, notice: 'Agenda item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /agenda_items/1
  def update
    if @agenda_item.update(agenda_item_params)
      redirect_to @agenda_item, notice: 'Agenda item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /agenda_items/1
  def destroy
    @agenda_item.destroy
    redirect_to agenda_items_url, notice: 'Agenda item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda_item
      @agenda_item = AgendaItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agenda_item_params
      params.require(:agenda_item).permit(:start_time, :end_time, :location, :activity_name, :description, :photo, :leader_id, :is_cyoa, :budget_line_id)
    end
end
