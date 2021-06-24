require 'rails_helper'

describe User do
  describe 'associations' do
    it { is_expected.to have_many(:imports) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('email@addresse.foo').for(:email) }
    it { is_expected.to_not allow_value('foo').for(:email) }
  end
end
