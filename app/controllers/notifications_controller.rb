class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[show edit update destroy]

  def index
    @q = Notification.ransack(params[:q])
    @notifications = @q.result(distinct: true).includes(:creator).page(params[:page]).per(10)
  end

  def show; end

  def new
    @notification = Notification.new
  end

  def edit; end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      message = "Notification was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @notification, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification,
                  notice: "Notification was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    message = "Notification was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to notifications_url, notice: message
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:creator_id, :title, :body,
                                         :attachment)
  end
end
