class Api::V1::FamiliesController < Api::V1::GraphitiController
  def index
    families = FamilyResource.all(params)
    respond_with(families)
  end

  def show
    family = FamilyResource.find(params)
    respond_with(family)
  end

  def create
    family = FamilyResource.build(params)

    if family.save
      render jsonapi: family, status: :created
    else
      render jsonapi_errors: family
    end
  end

  def update
    family = FamilyResource.find(params)

    if family.update_attributes
      render jsonapi: family
    else
      render jsonapi_errors: family
    end
  end

  def destroy
    family = FamilyResource.find(params)

    if family.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: family
    end
  end
end
