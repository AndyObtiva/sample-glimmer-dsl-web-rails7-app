require 'glimmer-dsl-web'

require_relative 'contact_manager/presenters/contact_presenter'
require_relative 'contact_manager/views/contact_table'
require_relative 'contact_manager/views/new_contact_form'

class ContactManager
  include Glimmer::Web::Component
  
  option :attributes_of_contacts
  
  attr_reader :presenter
  
  before_render do
    @presenter = ContactPresenter.new(attributes_of_contacts)
  end
  
  markup {
    div { # automatically gets .contact-manager class
      h1('Contact Manager')
      
      new_contact_form(presenter:)
      
      div(style: {margin: 10, clear: :both})
      
      contact_table(presenter:) {
        class_name(:hidden) <= [presenter, :contacts, on_read: :empty?]
      }
      
      p('No contacts available.', class: 'table-message') {
        class_name(:hidden) <= [presenter, :contacts, on_read: :any?]
      }
    }
  }
  
  style {
    r('body, .contact-manager') {
      background '#f7f4ee'
    }
    
    r('.contact-manager h1') {
      margin_left :auto
      margin_right :auto
    }
    
    r('.contact-manager h1, .contact-manager p.table-message') {
      text_align :center
    }
    
    r('.contact-manager .hidden') {
      display :none
    }
  }
end
