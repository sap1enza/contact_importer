class NonSpecialCharactersValidator < ApplicationValidator
  VALID_FORMAT = /\A[-a-z0-9 ]*\z/i

  def validate_each(record, attribute, value)
    return if value =~ VALID_FORMAT

    validate!(record, attribute, options)
  end
end
