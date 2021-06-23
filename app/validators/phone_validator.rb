class PhoneValidator < ApplicationValidator
  VALID_PHONE_FORMAT = /\A\(([^)]+)\) [0-9]{3}( |-)[0-9]{3}( |-)[0-9]{2}( |-)[0-9]{2}\Z/

  def validate_each(record, attribute, value)
    return if value =~ VALID_PHONE_FORMAT

    super
  end
end
