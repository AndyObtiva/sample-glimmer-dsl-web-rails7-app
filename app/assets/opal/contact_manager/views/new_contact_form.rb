require 'facets/string/titlecase'
require_relative '../models/contact'
require_relative '../presenters/contact_presenter'

class NewContactForm
  include Glimmer::Web::Component
  
  option :presenter
  
  markup {
    form { # automatically gets .new-contact-form class
      div(class: 'notice') {
        class_name(:hidden) <= [presenter.new_contact, :errors, on_read: :nil?]
        inner_text <= [presenter.new_contact, :error_message, computed_by: :errors]
      }
    
      div(class: 'attributes') {
        grouped_contact_attributes.each do |attribute_group|
          div(class: 'attribute-group') {
            attribute_group.each do |attribute|
              div(class: 'attribute') {
                input_id = "attribute-#{object_id}"
                
                label(attribute.titlecase, for: input_id)
                input(type: 'text', id: input_id) {
                  value <=> [presenter.new_contact, attribute]
                }
              }
            end
          }
        end
      }
      
      div(class: 'actions') {
        input(type: 'submit') {
          value <= [presenter.new_contact, :id, on_read: ->(val) {val.nil? ? 'Add Contact' : 'Update Contact'}]
        
          onclick do |event|
            event.prevent_default
            presenter.save_contact
          end
        }
      }
    }
  }
  
  style {
    r('.new-contact-form .notice') {
      margin_left :auto
      margin_right :auto
      text_align :center
      background :lightpink
      padding 10
      border '1px solid black'
      border_radius 5
    }
    
    r('form.new-contact-form') {
      display :table
      margin_left :auto
      margin_right :auto
      max_width 514
    }
    
    r('form.new-contact-form div.attribute-group') {
      display :inline
      float :left
      margin 10
    }
    
    r('form.new-contact-form div.attribute') {
      max_width 300
      margin_left :auto
      margin_right :auto
    }
    
    r('form.new-contact-form div label') {
      float :left
      width 80
      text_align :right
      padding_right 10
    }
    
    r('form.new-contact-form div input') {
      margin_bottom 5
    }
    
    r('form.new-contact-form .actions input[type=submit]') {
      display :block
      width 100.%
    }
    
    r('.new-contact-form .hidden') {
      display :none
    }
  }
  
  private
  
  def grouped_contact_attributes
    indexed_contacts = Contact::ATTRIBUTES_DISPLAY.each_with_index
    grouped_contacts_with_indexes = indexed_contacts.group_by {|attribute, i| (i / 4).to_i }
    grouped_contacts_with_indexes.values.map { |group| group.map(&:first) }
  end
end
