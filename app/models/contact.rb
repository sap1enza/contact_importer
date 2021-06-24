class Contact < ApplicationRecord
  validates :name, presence: true, non_special_characters: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :phone, phone: { nullify: true }

  validates :address, :credit_card, :franchise, presence: true

  def credit_card_digits
    credit_card&.last(4)
  end
end
