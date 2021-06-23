class ApplicationValidator < ActiveModel::EachValidator
  def validate!(record, attribute, options)
    if options[:nullify]
      record.send("#{attribute}=", nil)
    else
      record.errors.add(attribute.to_sym)
    end
  end

  def validate_each(record, attribute, value)
    if options[:nullify]
      record.send("#{attribute}=", nil)
    else
      record.errors.add(attribute.to_sym)
    end
  end
end
