class FamiliesController < ApplicationController
  before_action :set_family, only: %i[show edit update destroy]

  def index
    @q = Family.ransack(params[:q])
    @families = @q.result(distinct: true).includes(:users,
                                                   :scores).page(params[:page]).per(10)
  end

  def show
    @score = Score.new
    @user = User.new
  end

  def new
    @family = Family.new
  end

  def edit; end

  def create
    @family = Family.new(family_params)

    if @family.save
      redirect_to @family, notice: "Family was successfully created."
    else
      render :new
    end
  end

  def update
    if @family.update(family_params)
      redirect_to @family, notice: "Family was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @family.destroy
    redirect_to families_url, notice: "Family was successfully destroyed."
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name, :crest, :motto)
  end
end
