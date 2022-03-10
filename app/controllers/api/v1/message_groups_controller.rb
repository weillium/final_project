class Api::V1::MessageGroupsController < Api::V1::GraphitiController
  def index
    message_groups = MessageGroupResource.all(params)
    respond_with(message_groups)
  end

  def show
    message_group = MessageGroupResource.find(params)
    respond_with(message_group)
  end

  def create
    message_group = MessageGroupResource.build(params)

    if message_group.save
      render jsonapi: message_group, status: :created
    else
      render jsonapi_errors: message_group
    end
  end

  def update
    message_group = MessageGroupResource.find(params)

    if message_group.update_attributes
      render jsonapi: message_group
    else
      render jsonapi_errors: message_group
    end
  end

  def destroy
    message_group = MessageGroupResource.find(params)

    if message_group.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: message_group
    end
  end
end
