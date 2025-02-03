require 'glimmer-dsl-web'

require_relative 'contact_manager/models/contact'

class ContactManager
  include Glimmer::Web::Component
  
  option :attributes_of_contacts
  
  before_render do
    @contacts = attributes_of_contacts.map do |attributes_of_contact|
      Contact.new(attributes_of_contact.transform_keys(&:to_sym))
    end
  end
  
  markup {
    div(id: 'contacts') {
      p(id: 'notice', style: {color: :green})
      
      h1('Contacts')
      
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
  
  style {
    r('#notice, #contacts h1, #contacts table') {
      margin_left :auto
      margin_right :auto
    }
    
    r('#contacts h1') {
      text_align :center
    }
    
    r('#contacts table') {
      text_align :left
      border_spacing 0
      cursor :default
    }
    
    r('#contacts table thead tr th, #contacts table tbody tr td') {
      padding 10
    }
    
    r('#contacts table tbody tr:hover') {
      background :lightblue
    }
  }
end
