class SampleSelectorPresenter
  SAMPLE_NAMES = {
    'hello_world' => 'Hello, World!',
    'hello_button' => 'Hello, Button!',
    'hello_form' => 'Hello, Form!',
    'hello_observer' => 'Hello, Observer!',
    'hello_data_binding' => 'Hello, Data-Binding!',
    'hello_content_data_binding' => 'Hello, Content Data-Binding!',
    'hello_component' => 'Hello, Component!',
    'hello_paragraph' => 'Hello, Paragraph!',
    'hello_input_date_time' => 'Hello, Input Date/Time!',
    'button_counter' => 'Button Counter',
  }
  
  SAMPLES = SAMPLE_NAMES.keys
  
  attr_reader :selected_sample
  attr_accessor :selected_sample_code
  
  def selected_sample=(sample)
    @selected_sample = sample
    fetch_selected_sample_code
  end
  
  def fetch_selected_sample_code
    HTTP.get("/samples/#{selected_sample}.json") do |response|
      code = Native(response.body)['code']
      self.selected_sample_code = code
    end
  end
  
  def load_sample(sample = nil)
    sample ||= selected_sample
    # We must embeded static require/load statements for Opal to pre-load them into page
    case sample
    when 'hello_world'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_world.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_world.rb'
      end
    when 'hello_button'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_button.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_button.rb'
      end
    when 'hello_form'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_form.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_form.rb'
      end
    when 'hello_observer'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_observer.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_observer.rb'
      end
    when 'hello_data_binding'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_data_binding.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_data_binding.rb'
      end
    when 'hello_content_data_binding'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
      end
    when 'hello_component'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_component.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_component.rb'
      end
    when 'hello_paragraph'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_paragraph.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_paragraph.rb'
      end
    when 'hello_input_date_time'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
      end
    when 'button_counter'
      begin
        load 'glimmer-dsl-web/samples/regular/button_counter.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/regular/button_counter.rb'
      end
    end
  end
end
