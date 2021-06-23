class EmailValidator < ApplicationValidator
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def validate_each(record, attribute, value)
    return if value =~ VALID_EMAIL_FORMAT

    super
  end
end
