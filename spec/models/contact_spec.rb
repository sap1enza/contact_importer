# frozen_string_literal: true

require 'rails_helper'

describe Contact do
  subject(:contact) { create(:contact) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:credit_card) }
    it { is_expected.to validate_presence_of(:franchise) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.not_to allow_value('philip@&#%').for(:name) }
    it { is_expected.to allow_value('-philip').for(:name) }
    it { is_expected.to allow_value('philip-koelpin').for(:name) }
    it { is_expected.to allow_value('phillip koelpin').for(:name) }

    context 'with nullify true' do
      context 'phone' do
        it 'with a valid phone number' do
          contact.phone = '(+57) 320 432 05 09'

          expect { contact.save }.not_to change { contact.phone }
        end

        it 'with an invalid phone number' do
          contact.phone = '1234567800'

          expect { contact.save }.to change { contact.phone }.to eq(nil)
        end
      end
    end
  end
end
