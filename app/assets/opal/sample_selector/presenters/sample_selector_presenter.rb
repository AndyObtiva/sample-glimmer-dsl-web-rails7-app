require_relative '../models/sample'

class SampleSelectorPresenter
  SAMPLE_NAMES = {
    'hello_world' => 'Hello, World!',
    'hello_button' => 'Hello, Button!',
    'hello_form' => 'Hello, Form!',
    'hello_observer' => 'Hello, Observer!',
    'hello_observer_data_binding' => 'Hello, Observer (Data-Binding)!',
    'hello_data_binding' => 'Hello, Data-Binding!',
    'hello_content_data_binding' => 'Hello, Content Data-Binding!',
    'hello_component' => 'Hello, Component!',
    'hello_component_slots' => 'Hello, Component Slots!',
    'hello_component_listeners' => 'Hello, Component Listeners!',
    'hello_component_attribute_listeners' => 'Hello, Component Attribute Listeners!',
    'hello_component_listeners_default_slot' => 'Hello, Component Listeners (Default Slot)!',
    'hello_paragraph' => 'Hello, Paragraph!',
    'hello_input_date_time' => 'Hello, Input Date/Time!',
    'hello_form_mvp' => 'Hello, Form (MVP)!',
    'hello_style' => 'Hello, Style!',
    'hello_svg' => 'Hello, SVG!',
    'button_counter' => 'Button Counter',
    'todo_mvc' => 'Todo MVC',
  }
  
  SAMPLES = SAMPLE_NAMES.map { |id, name| Sample.new(id:, name:) }
  
  attr_reader :selected_sample
  attr_accessor :selected_sample_code
  
  def initialize
    self.selected_sample = SAMPLES.first
  end
  
  def selected_sample=(sample)
    # causes selected sample to get highlighted in the View indirectly through data-binding
    @selected_sample = sample
    
    @selected_sample.fetch_code do |code|
      # causes selected sample code to display in the View indirectly through data-binding
      self.selected_sample_code = code
    end
  end
  
  def run
    selected_sample.run
  end
end
