class EquationSolver
  attr_reader :a, :b, :c

  def initialize(factors)
    @a = factors.fetch('a')
    @b = factors.fetch('b')
    @c = factors.fetch('c')
  end
end