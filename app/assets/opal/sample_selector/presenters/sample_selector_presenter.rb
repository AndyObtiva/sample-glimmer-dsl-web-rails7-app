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
    'hello_paragraph' => 'Hello, Paragraph!',
    'hello_input_date_time' => 'Hello, Input Date/Time!',
    'hello_form_mvp' => 'Hello, Form (MVP)!',
    'button_counter' => 'Button Counter',
  }
  
  SAMPLES = SAMPLE_NAMES.map { |id, name| Sample.new(id:, name:) }
  
  attr_reader :selected_sample
  attr_accessor :selected_sample_code
  
  def initialize
    self.selected_sample = SAMPLES.first
  end
  
  def selected_sample=(sample)
    @selected_sample = sample
    fetch_selected_sample_code
  end
  
  def fetch_selected_sample_code
    HTTP.get("/samples/#{selected_sample.id}.json") do |response|
      code = Native(response.body).code
      self.selected_sample_code = code
    end
  end
  
  def load_sample
    selected_sample.load_sample
  end
end
