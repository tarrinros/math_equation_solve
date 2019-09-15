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

  def solve
    valid_equation_params = EquationForm.new(equation_params)
    @result = QuadraticEquationSolver.call(valid_equation_params)
    render action: 'result'
  end

  def result; end

  private

  def set_equation
    @equation = Equation.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def equation_params
    params.require(:equation).permit(:title, :a, :b, :c)
  end
end
