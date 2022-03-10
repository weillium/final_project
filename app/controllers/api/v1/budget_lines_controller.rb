class Api::V1::BudgetLinesController < Api::V1::GraphitiController
  def index
    budget_lines = BudgetLineResource.all(params)
    respond_with(budget_lines)
  end

  def show
    budget_line = BudgetLineResource.find(params)
    respond_with(budget_line)
  end

  def create
    budget_line = BudgetLineResource.build(params)

    if budget_line.save
      render jsonapi: budget_line, status: :created
    else
      render jsonapi_errors: budget_line
    end
  end

  def update
    budget_line = BudgetLineResource.find(params)

    if budget_line.update_attributes
      render jsonapi: budget_line
    else
      render jsonapi_errors: budget_line
    end
  end

  def destroy
    budget_line = BudgetLineResource.find(params)

    if budget_line.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: budget_line
    end
  end
end
