# frozen_string_literal: false
require 'credit_card_validations/string'

class ImportingJob < ApplicationJob
  queue_as :default

  def perform(import_id, mapped_columns)
    import = Import.find(import_id)
    import.processing!

    imported_contacts = []

    CSV.parse(import.file.download, headers: true) do |row|

      contact = Contact.new(
        name: row[mapped_columns[:name]],
        birthdate: row[mapped_columns[:birthdate]],
        email: row[mapped_columns[:email]],
        address: row[mapped_columns[:address]],
        franchise: row[mapped_columns[:credit_card]].credit_card_brand,
        credit_card: row[mapped_columns[:credit_card]]
      )

      imported_contacts << contact.id if contact.save

      contacts_log = { object: contact.attributes, errors: contact.errors.full_messages }.as_json
      import.contacts.append(contacts_log)
    end

    if imported_contacts.empty?
      import.failed!
    else
      import.terminated!
    end
  end
end
