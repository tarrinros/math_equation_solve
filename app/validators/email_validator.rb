class EmailValidator < ActiveModel::EachValidator
  def validate_each(user, attribute, value)
    unless value =~ /\A[^@]+@[^@]+\z/i
      user.errors[attribute] << (options[:message] || 'Wrong email format')
    end
  end
end