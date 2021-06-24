module ImportsHelper
  def contact_columns
    Contact.column_names.excluding(non_importable_contact_columns)
  end

  def non_importable_contact_columns
    %w[
      id
      created_at
      updated_at
    ]
  end
end
