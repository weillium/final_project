class MessageGroupsController < ApplicationController
  before_action :set_message_group, only: %i[show edit update destroy]

  def index
    @q = MessageGroup.ransack(params[:q])
    @message_groups = @q.result(distinct: true).includes(:messages,
                                                         :group_members).page(params[:page]).per(10)
  end

  def show
    @group_member = GroupMember.new
    @message = Message.new
  end

  def new
    @message_group = MessageGroup.new
  end

  def edit; end

  def create
    @message_group = MessageGroup.new(message_group_params)

    if @message_group.save
      redirect_to @message_group,
                  notice: "Message group was successfully created."
    else
      render :new
    end
  end

  def update
    if @message_group.update(message_group_params)
      redirect_to @message_group,
                  notice: "Message group was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @message_group.destroy
    redirect_to message_groups_url,
                notice: "Message group was successfully destroyed."
  end

  private

  def set_message_group
    @message_group = MessageGroup.find(params[:id])
  end

  def message_group_params
    params.fetch(:message_group, {})
  end
end
