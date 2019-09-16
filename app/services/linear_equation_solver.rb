require 'matrix'
require_relative 'linear_equation_parser'
require 'byebug'

class LinearEquation
  include LinearEquationParser < ApplicationService

  attr_accessor :coefficients, :constant, :variables
  attr_reader :operations

  def initialize(factors, vars=nil)
    @factors = factors[]
    @constant = nil
    @variables = nil
  end

  def call
    coefficients = Matrix.row_vector(coefficients)
    constant = constant
    if vars.nil?
      # byebug
      variables = Array.new(coefficients.column_count) do |i|
        "X#{i}"
      end
    else
      variables = vars
    end
    obj
  end

  def to_s
    signs = @coefficients.map do |c|
      :'+' if c.to_s.to_r >= 0.to_r
      :'-' if c.to_s.to_r < 0.to_r
    end
    signs[0] = '' if signs.first == :'+'
    signs.
      zip(@coefficients, @variables).
      map {|s, c, v| "#{s}#{c}#{v}"}.
      join
  end
end