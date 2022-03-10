class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  # GET /group_members
  def index
    @group_members = GroupMember.page(params[:page]).per(10)
  end

  # GET /group_members/1
  def show
  end

  # GET /group_members/new
  def new
    @group_member = GroupMember.new
  end

  # GET /group_members/1/edit
  def edit
  end

  # POST /group_members
  def create
    @group_member = GroupMember.new(group_member_params)

    if @group_member.save
      message = 'GroupMember was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @group_member, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /group_members/1
  def update
    if @group_member.update(group_member_params)
      redirect_to @group_member, notice: 'Group member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /group_members/1
  def destroy
    @group_member.destroy
    message = "GroupMember was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to group_members_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :user_id)
    end
end
