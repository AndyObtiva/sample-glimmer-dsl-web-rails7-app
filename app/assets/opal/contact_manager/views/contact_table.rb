require 'facets/string/titlecase'
require_relative '../models/contact'
require_relative '../presenters/contact_presenter'

class ContactTable
  include Glimmer::Web::Component
  
  option :presenter
  
  markup {
    table { # automatically gets .contact-table class
      thead {
        tr {
          Contact::ATTRIBUTES_DISPLAY.each do |attribute|
            th(attribute.titlecase)
          end
        }
      }
      tbody {
        content(presenter, :contacts) {
          presenter.contacts.each do |contact|
            tr {
              Contact::ATTRIBUTES_DISPLAY.each do |attribute|
                td(contact[attribute].to_s)
              end
            }
          end
        }
      }
    }
  }
  
  style {
    r('table.contact-table') {
      margin_left :auto
      margin_right :auto
      text_align :left
      border_spacing 0
      cursor :default
    }
    
    r('table.contact-table thead tr th, table.contact-table tbody tr td') {
      padding 10
    }
    
    r('table.contact-table tbody tr:hover') {
      background :lightblue
    }
  }
end
