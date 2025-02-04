require 'glimmer-dsl-web'

require_relative 'contact_manager/presenters/contact_presenter'
require_relative 'contact_manager/views/contact_table'

class ContactManager
  include Glimmer::Web::Component
  
  option :attributes_of_contacts
  
  attr_reader :presenter
  
  before_render do
    @presenter = ContactPresenter.new(attributes_of_contacts)
  end
  
  markup {
    div {
      p(class: 'notice', style: {color: :green})
      
      h1('Contacts')
      
      if presenter.contacts&.any?
        contact_table(presenter:)
      else
        p('No contacts available.')
      end
    }
  }
  
  style {
    r('.contact-manager .notice, .contact-manager h1') {
      margin_left :auto
      margin_right :auto
    }
    
    r('.contact-manager h1') {
      text_align :center
    }
  }
end
