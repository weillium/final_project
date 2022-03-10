class Api::V1::NotificationsController < Api::V1::GraphitiController
  def index
    notifications = NotificationResource.all(params)
    respond_with(notifications)
  end

  def show
    notification = NotificationResource.find(params)
    respond_with(notification)
  end

  def create
    notification = NotificationResource.build(params)

    if notification.save
      render jsonapi: notification, status: 201
    else
      render jsonapi_errors: notification
    end
  end

  def update
    notification = NotificationResource.find(params)

    if notification.update_attributes
      render jsonapi: notification
    else
      render jsonapi_errors: notification
    end
  end

  def destroy
    notification = NotificationResource.find(params)

    if notification.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: notification
    end
  end
end
