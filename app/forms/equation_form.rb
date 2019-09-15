class EquationForm
  include ActiveModel::Model
  include Virtus.model

  attribute :title
  attribute :a
  attribute :b
  attribute :c

  validate :title

  # def initialize(attributes)
  #   super(attributes)
  # end
end