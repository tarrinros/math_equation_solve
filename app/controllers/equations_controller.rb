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

  # Validates incoming params
  # Transforms values to float
  # Depends on title_key sends to Solver
  def solve
    respond_to do |format|
      if EquationForm.new(equation_params).valid?
        params = equation_params.transform_values(&:to_f)
        @result = if equation_params.value?('linear')
                    LinearEquationSolver.call(params)
                  else
                    QuadraticEquationSolver.call(params)
                  end

        format.js { render partial: 'result' }
        render json: @result
        # render json: { result: @result }

        # format.html { render :show, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @result }
      else
        render 'equations/show', alert: 'Wrong factors format'
      end
    end
  end

  private

  def set_equation
    @equation = Equation.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def equation_params
    params.require(:equation_form).permit(:title, :a, :b, :c)
  end
end
