require 'glimmer-dsl-web'

require_relative 'contact_management/models/contact'

class ContactManagement
  include Glimmer::Web::Component
  
  option :attributes_of_contacts
  
  before_render do
    @contacts = attributes_of_contacts.map do |attributes_of_contact|
      Contact.new(attributes_of_contact.transform_keys(&:to_sym))
    end
  end
  
  markup {
    div {
      if attributes_of_contacts&.any?
        table {
          thead {
            tr {
              Contact::ATTRIBUTES_DISPLAYABLE.each do |attribute|
                th(attribute.split('_').map(&:capitalize).join(' '))
              end
            }
          }
          tbody {
            @contacts.each do |contact|
              tr {
                Contact::ATTRIBUTES_DISPLAYABLE.each do |attribute|
                  td(contact[attribute].to_s)
                end
              }
            end
          }
        }
      else
        p('No contacts available.')
      end
    }
  }
end
