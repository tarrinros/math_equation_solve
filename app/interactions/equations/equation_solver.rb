class EquationSolver < ActiveInteraction::Base
  string :title
  integer :a, :b, :c

  def execute
    QuadraticEquationSolver.call(params)
  end
end