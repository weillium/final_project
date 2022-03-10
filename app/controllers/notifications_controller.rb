class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[show edit update destroy]

  # GET /notifications
  def index
    @q = Notification.ransack(params[:q])
    @notifications = @q.result(distinct: true).includes(:creator).page(params[:page]).per(10)
  end

  # GET /notifications/1
  def show; end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit; end

  # POST /notifications
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

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      redirect_to @notification,
                  notice: "Notification was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /notifications/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def notification_params
    params.require(:notification).permit(:creator_id, :title, :body,
                                         :attachment)
  end
end
