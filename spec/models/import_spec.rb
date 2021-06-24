require 'rails_helper'

describe Import do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'enum' do
    it do
      is_expected.to define_enum_for(:status).
        with_values(
          on_hold: 'on_hold',
          processing: 'processing',
          failed: 'failed',
          terminated: 'terminated'
        ).
        backed_by_column_of_type(:string)
    end
  end
end
