require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without a email' do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
