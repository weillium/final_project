class Api::V1::BudgetTypesController < Api::V1::GraphitiController
  def index
    budget_types = BudgetTypeResource.all(params)
    respond_with(budget_types)
  end

  def show
    budget_type = BudgetTypeResource.find(params)
    respond_with(budget_type)
  end

  def create
    budget_type = BudgetTypeResource.build(params)

    if budget_type.save
      render jsonapi: budget_type, status: 201
    else
      render jsonapi_errors: budget_type
    end
  end

  def update
    budget_type = BudgetTypeResource.find(params)

    if budget_type.update_attributes
      render jsonapi: budget_type
    else
      render jsonapi_errors: budget_type
    end
  end

  def destroy
    budget_type = BudgetTypeResource.find(params)

    if budget_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: budget_type
    end
  end
end
