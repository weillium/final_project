class BudgetLinesController < ApplicationController
  before_action :set_budget_line, only: %i[show edit update destroy]

  def index
    @q = BudgetLine.ransack(params[:q])
    @budget_lines = @q.result(distinct: true).includes(:itineraries,
                                                       :budget_type).page(params[:page]).per(10)
  end

  def show
    @agenda_item = AgendaItem.new
  end

  def new
    @budget_line = BudgetLine.new
  end

  def edit; end

  def create
    @budget_line = BudgetLine.new(budget_line_params)

    if @budget_line.save
      message = "BudgetLine was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @budget_line, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @budget_line.update(budget_line_params)
      redirect_to @budget_line, notice: "Budget line was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @budget_line.destroy
    message = "BudgetLine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to budget_lines_url, notice: message
    end
  end

  private

  def set_budget_line
    @budget_line = BudgetLine.find(params[:id])
  end

  def budget_line_params
    params.require(:budget_line).permit(:budgeted_amount, :actual_amount,
                                        :notes, :budget_type_id)
  end
end
