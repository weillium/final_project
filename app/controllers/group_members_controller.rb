class GroupMembersController < ApplicationController
  before_action :set_group_member, only: %i[show edit update destroy]

  def index
    @q = GroupMember.ransack(params[:q])
    @group_members = @q.result(distinct: true).includes(:user,
                                                        :group).page(params[:page]).per(10)
  end

  def show; end

  def new
    @group_member = GroupMember.new
  end

  def edit; end

  def create
    @group_member = GroupMember.new(group_member_params)

    if @group_member.save
      message = "GroupMember was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @group_member, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @group_member.update(group_member_params)
      redirect_to @group_member,
                  notice: "Group member was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @group_member.destroy
    message = "GroupMember was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to group_members_url, notice: message
    end
  end

  private

  def set_group_member
    @group_member = GroupMember.find(params[:id])
  end

  def group_member_params
    params.require(:group_member).permit(:group_id, :user_id)
  end
end
