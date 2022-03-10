class BudgetTypesController < ApplicationController
  before_action :set_budget_type, only: %i[show edit update destroy]

  def index
    @q = BudgetType.ransack(params[:q])
    @budget_types = @q.result(distinct: true).includes(:budgets).page(params[:page]).per(10)
  end

  def show
    @budget_line = BudgetLine.new
  end

  def new
    @budget_type = BudgetType.new
  end

  def edit; end

  def create
    @budget_type = BudgetType.new(budget_type_params)

    if @budget_type.save
      redirect_to @budget_type, notice: "Budget type was successfully created."
    else
      render :new
    end
  end

  def update
    if @budget_type.update(budget_type_params)
      redirect_to @budget_type, notice: "Budget type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @budget_type.destroy
    redirect_to budget_types_url,
                notice: "Budget type was successfully destroyed."
  end

  private

  def set_budget_type
    @budget_type = BudgetType.find(params[:id])
  end

  def budget_type_params
    params.require(:budget_type).permit(:type_name)
  end
end
