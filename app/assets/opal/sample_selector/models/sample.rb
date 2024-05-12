class Sample
  attr_reader :id, :name
  
  def initialize(id:, name:)
    @id = id
    @name = name
  end
  
  def load_sample
    # We must embeded static require/load statements for Opal to pre-load them into page
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
    when 'button_counter'
      begin
        load 'glimmer-dsl-web/samples/regular/button_counter.rb'
      rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
        require 'glimmer-dsl-web/samples/regular/button_counter.rb'
      end
    end
  end
end
