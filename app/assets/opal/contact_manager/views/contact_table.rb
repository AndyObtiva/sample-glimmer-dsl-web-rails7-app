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
          
          th(class: 'action-column') # actions
        }
      }
      tbody {
        content(presenter, :contacts) {
          presenter.contacts.each do |contact|
            tr {
              Contact::ATTRIBUTES_DISPLAY.each do |attribute|
                td(contact[attribute].to_s)
              end
              
              td(class: 'destroy') {
                onclick do |event|
                  event.prevent_default
                  presenter.delete_contact(contact)
                end
              }
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
      height 34
    }
    
    r('table.contact-table tbody tr:hover') {
      background :lightblue
    }
    
    # TODO odd row coloring
    
    r('table.contact-table thead tr th.action-column') {
      width 20
    }
      
    r('table.contact-table tbody tr td.destroy') {
      bottom 0
      color '#949494'
      display :none
      font_size 29
      margin 'auto 0'
      right 10
      top 0
      transition 'color .2s ease-out'
      width 20
    }
    
    r('table.contact-table tbody tr td.destroy:after') {
      content '"×"'
      display :block
      height 100.%
      line_height '1.1'
    }
    
    r('table.contact-table tbody tr:focus td.destroy, table.contact-table tbody tr:hover td.destroy') {
      display :block
    }
    
    r('table.contact-table tbody tr td.destroy:focus, table.contact-table tbody tr td.destroy:hover') {
      display :block
      color :black
    }
  }
end
