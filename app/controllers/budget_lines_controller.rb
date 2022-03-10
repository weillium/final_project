class BudgetLinesController < ApplicationController
  before_action :set_budget_line, only: [:show, :edit, :update, :destroy]

  # GET /budget_lines
  def index
    @budget_lines = BudgetLine.all
  end

  # GET /budget_lines/1
  def show
    @agenda_item = AgendaItem.new
  end

  # GET /budget_lines/new
  def new
    @budget_line = BudgetLine.new
  end

  # GET /budget_lines/1/edit
  def edit
  end

  # POST /budget_lines
  def create
    @budget_line = BudgetLine.new(budget_line_params)

    if @budget_line.save
      message = 'BudgetLine was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @budget_line, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /budget_lines/1
  def update
    if @budget_line.update(budget_line_params)
      redirect_to @budget_line, notice: 'Budget line was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_lines/1
  def destroy
    @budget_line.destroy
    message = "BudgetLine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to budget_lines_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_line
      @budget_line = BudgetLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_line_params
      params.require(:budget_line).permit(:budgeted_amount, :actual_amount, :notes, :budget_type_id)
    end
end
