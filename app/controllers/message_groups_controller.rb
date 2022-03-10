class MessageGroupsController < ApplicationController
  before_action :set_message_group, only: [:show, :edit, :update, :destroy]

  # GET /message_groups
  def index
    @message_groups = MessageGroup.page(params[:page]).per(10)
  end

  # GET /message_groups/1
  def show
    @group_member = GroupMember.new
    @message = Message.new
  end

  # GET /message_groups/new
  def new
    @message_group = MessageGroup.new
  end

  # GET /message_groups/1/edit
  def edit
  end

  # POST /message_groups
  def create
    @message_group = MessageGroup.new(message_group_params)

    if @message_group.save
      redirect_to @message_group, notice: 'Message group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /message_groups/1
  def update
    if @message_group.update(message_group_params)
      redirect_to @message_group, notice: 'Message group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /message_groups/1
  def destroy
    @message_group.destroy
    redirect_to message_groups_url, notice: 'Message group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_group
      @message_group = MessageGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_group_params
      params.fetch(:message_group, {})
    end
end
