require 'cmath'

class QuadraticEquationSolver
  attr_reader :a, :b, :c

  def initialize(factors)
    factors = JSON(factors)
    @a = factors.fetch('a')
    @b = factors.fetch('b')
    @c = factors.fetch('c')
  end

  def process
    return {text: 'Not a quadratic equation. a = 0'}.to_json if a.zero?
    x1, x2 = solve
    result(x1, x2).to_json
  end

  private

  def solve
    return simple_result if discriminant.zero?

    sqrt_value = CMath.sqrt(discriminant)
    first_roots, second_roots = roots(sqrt_value)
  end

  def discriminant
    @discriminant ||= b ** 2 - 4 * a * c
  end

  def simple_result
    {
      text: 'Roots are real and same',
      x: "#{(-b / 2 / a)}"
    }
  end

  def roots(sqrt_value)
    if discriminant > 0
      x1 = [(-b - sqrt_value) / 2 / a]
      x2 = [(-b + sqrt_value) / 2 / a]
    else
      x1 = [-b / 2 / a, -sqrt_value / 2 / a]
      x2 = [-b / 2 / a, sqrt_value / 2 / a]
    end
    [x1, x2]
  end

  def result(x1, x2)
    if (discriminant > 0)
      return {
        text: 'Roots are real and different',
        x1: "#{x1.join(',')}",
        x2: "#{x2.join(',')}"
      }
    end

    {
      text: 'Roots are complex',
      x1: "#{x1.join(',')}",
      x2: "#{x2.join(',')}"
    }
  end
end