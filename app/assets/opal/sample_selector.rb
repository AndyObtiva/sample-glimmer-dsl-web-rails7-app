require 'glimmer-dsl-web'

require_relative 'sample_selector/presenters/sample_selector_presenter'
require_relative 'sample_selector/views/back_anchor'
require_relative 'sample_selector/views/highlighted_code'
require_relative 'sample_selector/views/samples_table'

class SampleSelector
  include Glimmer::Web::Component
  
  before_render do
    @presenter = SampleSelectorPresenter.new
  end
  
  markup {
    div {
      h2("Run a sample or view a sample's code.", style: 'text-align: center;')
      
      highlighted_code(language: 'ruby', model: @presenter, model_code_attribute: :selected_sample_code, float: 'right')
      
      samples_table(presenter: @presenter)
      
      button('Run', style: 'margin: 15px 0; padding: 10px; font-size: 1.3em;') {
        onclick do |event|
          event.prevent_default
          markup_root.remove
          BackAnchor.render unless @presenter.selected_sample.id == 'todo_mvc'
          @presenter.run
        end
      }
    }
  }
end
