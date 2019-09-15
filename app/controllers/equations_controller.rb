class EquationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_current_user, except: [:index]
  before_action :set_equation, only: [:show]

  def index
    @equations = Equation.all
  end

  def show
    @equation_form = EquationForm.new
  end

  def solve; end

  def result
    # input = {a: 2, b: 4, c: -30}.to_json
    @result = QuadraticEquationSolver.call(equation_params)
  end

  private

  def set_equation
    @equation = Equation.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def equation_params
    params.require(:equation).permit(:a, :b, :c)
  end
end
