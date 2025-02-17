require 'rails/resource_service'

require_relative '../models/contact'

class ContactPresenter
  attr_accessor :contacts, :edit_index
  
  def initialize(attributes_of_contacts)
    @contacts = attributes_of_contacts.map do |attributes_of_contact|
      Contact.new(attributes_of_contact.transform_keys(&:to_sym))
    end
  end
  
  def form_contact
    time_in_millis = Time.now.to_i
    @form_contact ||= Contact.new
  end
  
  def save_contact
    if form_contact.id.nil?
      add_contact
    else
      update_contact
    end
  end
  
  def add_contact
    Rails::ResourceService.create(resource: form_contact) do |response|
      if response.ok?
        created_contact_response_body = Native(response.body)
        created_contact = form_contact.clone
        created_contact.id = created_contact_response_body.id
        created_contact.created_at = created_contact_response_body.created_at
        created_contact.updated_at = created_contact_response_body.updated_at
        contacts << created_contact
        form_contact.reset
        form_contact.errors = nil
      else
        form_contact.errors = JSON.parse(response.body)
      end
    end
  end
  
  def update_contact
    Rails::ResourceService.update(resource: form_contact) do |response|
      if response.ok?
        updated_contact_response_body = Native(response.body)
        updated_contact = form_contact.clone
        updated_contact.updated_at = updated_contact_response_body.updated_at
        contacts[edit_index].load_with(updated_contact)
        self.edit_index = nil
        form_contact.reset
        form_contact.errors = nil
      else
        form_contact.errors = JSON.parse(response.body)
      end
    end
  end
  
  def edit_contact(contact)
    self.edit_index = contacts.index(contact)
    form_contact.load_with(contact)
    form_contact.errors = nil
  end
  
  def delete_contact(contact)
    delete_contact_confirmation = $$.confirm("Are you sure you want to delete that contact?")
    if delete_contact_confirmation
      Rails::ResourceService.destroy(resource: contact) do |response|
        if response.ok?
          contacts.delete(contact)
          self.edit_index = nil
          form_contact.reset
          form_contact.errors = nil
        end
      end
    end
  end
end
