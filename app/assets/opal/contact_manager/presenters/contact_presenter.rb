require_relative '../models/contact'
require_relative '../services/resource_service'

class ContactPresenter
  attr_accessor :contacts
  
  def initialize(attributes_of_contacts)
    @contacts = attributes_of_contacts.map do |attributes_of_contact|
      Contact.new(attributes_of_contact.transform_keys(&:to_sym))
    end
  end
  
  def new_contact
    time_in_millis = Time.now.to_i
    @new_contact ||= Contact.new(
      first_name: "John #{time_in_millis}", # TODO delete all those arguments (they're here for testing only)
      last_name: "Doe #{time_in_millis}",
      email: "john#{time_in_millis}@doe.com",
      phone: time_in_millis.to_s.chars.take(10).join,
      street: "123 Spiggot #{time_in_millis}",
      city: "Chicago",
      state: "Illinois",
      zip: "60662",
    )
  end
  
  def add_contact
    ResourceService.create(new_contact) do |response|
      if response.ok?
        created_contact_response_body = Native(response.body)
        created_contact = new_contact.clone
        created_contact.id = created_contact_response_body.id
        created_contact.created_at = created_contact_response_body.created_at
        created_contact.updated_at = created_contact_response_body.updated_at
        contacts << created_contact
        new_contact.reset
#       else # TODO handle error by displaying errors on screen without clearing contact
      end
    end
  end
  
  def delete_contact(contact)
    delete_contact_confirmation = $$.confirm("Are you sure you want to delete that contact?")
    if delete_contact_confirmation
      ResourceService.destroy(contact) do |response|
        if response.ok?
          contacts.delete(contact)
        end
      end
    end
  end
end
