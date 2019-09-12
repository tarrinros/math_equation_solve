class EquationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  before_action :set_current_user, except: [:index]

  def index
    @equations = Equation.all
  end

  def show
    @equation = Equation.find_by(params[:id])
  end

  def result; end

  private

  def set_current_user
    @user = current_user
  end

  def equation_params
    params.require(:equation).permit(:type)
  end
end
