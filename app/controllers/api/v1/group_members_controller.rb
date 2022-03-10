class Api::V1::GroupMembersController < Api::V1::GraphitiController
  def index
    group_members = GroupMemberResource.all(params)
    respond_with(group_members)
  end

  def show
    group_member = GroupMemberResource.find(params)
    respond_with(group_member)
  end

  def create
    group_member = GroupMemberResource.build(params)

    if group_member.save
      render jsonapi: group_member, status: :created
    else
      render jsonapi_errors: group_member
    end
  end

  def update
    group_member = GroupMemberResource.find(params)

    if group_member.update_attributes
      render jsonapi: group_member
    else
      render jsonapi_errors: group_member
    end
  end

  def destroy
    group_member = GroupMemberResource.find(params)

    if group_member.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: group_member
    end
  end
end
