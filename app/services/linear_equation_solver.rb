class LinearEquationSolver < ApplicationService
  attr_reader :a, :b, :c

  def initialize(factors)
    @a = factors.fetch('a')
    @b = factors.fetch('b')
    @c = factors.fetch('c')
  end

  def call
    return {text: 'a = 0. Equation cannot be solved'} if a.zero?
    if b > 0
      factor_b = -b
      solve(factor_b)
    else
      factor_b = +b
      solve(factor_b)
    end
  end

  private

  def solve(b)
    result = (c + b) / a
    return {
      text: 'Solution:',
      x: "x = #{result}"
    }
  end
end