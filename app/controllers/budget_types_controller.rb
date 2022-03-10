class BudgetTypesController < ApplicationController
  before_action :set_budget_type, only: [:show, :edit, :update, :destroy]

  # GET /budget_types
  def index
    @budget_types = BudgetType.all
  end

  # GET /budget_types/1
  def show
    @budget_line = BudgetLine.new
  end

  # GET /budget_types/new
  def new
    @budget_type = BudgetType.new
  end

  # GET /budget_types/1/edit
  def edit
  end

  # POST /budget_types
  def create
    @budget_type = BudgetType.new(budget_type_params)

    if @budget_type.save
      redirect_to @budget_type, notice: 'Budget type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_types/1
  def update
    if @budget_type.update(budget_type_params)
      redirect_to @budget_type, notice: 'Budget type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_types/1
  def destroy
    @budget_type.destroy
    redirect_to budget_types_url, notice: 'Budget type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_type
      @budget_type = BudgetType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_type_params
      params.require(:budget_type).permit(:type_name)
    end
end
