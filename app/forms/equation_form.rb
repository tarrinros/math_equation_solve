class EquationForm
  include ActiveModel::Model
  include ShallowAttributes
  include ActiveModel::Validations

  attribute :title, String
  attribute :a, Integer
  attribute :b, Integer
  attribute :c, Integer

  validates :a, presence: true
  validates :b, presence: true
  validates :c, presence: true
end