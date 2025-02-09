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
          presenter.contacts.each_with_index do |contact, contact_index|
            tr {
              Contact::ATTRIBUTES_DISPLAY.each do |attribute|
                td {
                  inner_text <= [contact, attribute]
                }
              end
              
              td(class: 'destroy') {
                onclick do |event|
                  event.prevent_default
                  presenter.delete_contact(contact)
                end
              }
              
              class_name(:editable) <= [presenter, :edit_index, on_read: ->(edit_index) { edit_index == contact_index}]
              
              onclick do |event|
                event.prevent_default
                presenter.edit_contact(contact)
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
      height 34
    }
    
    r('table.contact-table tbody tr:nth-child(odd)') {
      background '#fffff9'
    }
    
    r('table.contact-table tbody tr:hover') {
      background :lightblue
      transition 'background .2s ease-out'
    }
    
    r('table.contact-table thead tr th.action-column') {
      width 20
    }
    
    r('table.contact-table tbody tr td') {
      border_top '3px solid transparent'
      border_bottom '3px solid transparent'
    }
    
    r('table.contact-table tbody tr td:first-child') {
      border_left '3px solid transparent'
      border_top '3px solid transparent'
      border_bottom '3px solid transparent'
    }
    
    r('table.contact-table tbody tr td:last-child') {
      border_right '3px solid transparent'
      border_top '3px solid transparent'
      border_bottom '3px solid transparent'
    }
    
    r('table.contact-table tbody tr.editable td') {
      border_top '3px solid lightblue'
      border_bottom '3px solid lightblue'
    }
    
    r('table.contact-table tbody tr.editable td:first-child') {
      border_left '3px solid lightblue'
      border_top '3px solid lightblue'
      border_bottom '3px solid lightblue'
    }
    
    r('table.contact-table tbody tr.editable td:last-child') {
      border_right '3px solid lightblue'
      border_top '3px solid lightblue'
      border_bottom '3px solid lightblue'
    }
      
    r('table.contact-table tbody tr td.destroy') {
      bottom 0
      font_size 29
      margin 'auto 0'
      right 10
      top 0
      width 20
    }
    
    r('table.contact-table tbody tr td.destroy:after') {
      content '"×"'
      color '#949494'
      display :block
      height 100.%
      line_height '1.1'
      opacity '0'
      transition 'opacity .2s ease-out, color .2s ease-out'
    }
    
    r('table.contact-table tbody tr:focus td.destroy:after, table.contact-table tbody tr:hover td.destroy:after') {
      opacity '1'
    }
    
    r('table.contact-table tbody tr td.destroy:focus:after, table.contact-table tbody tr td.destroy:hover:after') {
      color :black
    }
  }
end
