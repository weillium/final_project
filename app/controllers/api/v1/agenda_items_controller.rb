class Api::V1::AgendaItemsController < Api::V1::GraphitiController
  def index
    agenda_items = AgendaItemResource.all(params)
    respond_with(agenda_items)
  end

  def show
    agenda_item = AgendaItemResource.find(params)
    respond_with(agenda_item)
  end

  def create
    agenda_item = AgendaItemResource.build(params)

    if agenda_item.save
      render jsonapi: agenda_item, status: 201
    else
      render jsonapi_errors: agenda_item
    end
  end

  def update
    agenda_item = AgendaItemResource.find(params)

    if agenda_item.update_attributes
      render jsonapi: agenda_item
    else
      render jsonapi_errors: agenda_item
    end
  end

  def destroy
    agenda_item = AgendaItemResource.find(params)

    if agenda_item.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: agenda_item
    end
  end
end
