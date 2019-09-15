class EquationForm
  include ActiveModel::Model
  include Virtus

  attribute :a
  attribute :b
  attribute :c

  # def initialize(attributes)
  #   super(attributes)
  # end
end