class EquationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_current_user, except: [:index]
  before_action :set_equation, only: [:show]

  def index
    @equations = Equation.all
  end

  def show; end

  def result; end

  private

  def set_equation
    @equation = Equation.find_by(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def equation_params
    params.require(:equation).permit(:type)
  end
end
