class EquationSolver
  attr_reader :a, :b, :c

  def initialize(factors)
    @a = factors[a]
    @b = factors[b]
    @c = factors[c]
  end
end