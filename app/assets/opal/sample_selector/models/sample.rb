require_relative 'sample_api'

# Sample Frontend Model
class Sample
  attr_reader :id, :name, :code
  
  def initialize(id:, name:)
    @id = id
    @name = name
  end
  
  def fetch_code(&code_processor)
    SampleApi.show(id) do |sample|
      @code = sample.code
      code_processor.call(@code)
    end
  end
  
  def run
    # NOTE: This is NOT normal code for everyday development. In real apps, this is not needed normally,
    # so do not gage normal use of the Frontend Framework by this code.
    # This is a sample app that dynamically loads/unloads Ruby files, which is NOT a common practice.
    # We embed static require/load statements below for Opal to auto-link to them during transpilation.
    case @id
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
    when 'hello_observer_data_binding'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_observer_data_binding.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_observer_data_binding.rb'
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
    when 'hello_component_slots'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_component_slots.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_component_slots.rb'
      end
    when 'hello_component_listeners'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_component_listeners.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_component_listeners.rb'
      end
    when 'hello_component_listeners_default_slot'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_component_listeners_default_slot.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_component_listeners_default_slot.rb'
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
    when 'hello_form_mvp'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_form_mvp.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_form_mvp.rb'
      end
    when 'hello_style'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_style.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_style.rb'
      end
    when 'hello_svg'
      begin
        load 'glimmer-dsl-web/samples/hello/hello_svg.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/hello/hello_svg.rb'
      end
    when 'button_counter'
      begin
        load 'glimmer-dsl-web/samples/regular/button_counter.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/regular/button_counter.rb'
      end
    when 'todo_mvc'
      begin
        load 'glimmer-dsl-web/samples/regular/todo_mvc.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/regular/todo_mvc.rb'
      end
    end
  end
end
