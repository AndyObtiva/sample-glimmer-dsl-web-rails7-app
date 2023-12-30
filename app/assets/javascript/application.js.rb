require 'glimmer-dsl-web'

# To load a sample, enable one of the following lines and disable everything that follows
# require 'glimmer-dsl-web/samples/hello/hello_world.rb'
# require 'glimmer-dsl-web/samples/hello/hello_button.rb'
# require 'glimmer-dsl-web/samples/hello/hello_form.rb'

require 'puts_debuggerer'

include Glimmer

Document.ready? do
  div(parent: '#app-container') {
    label(class: 'greeting') {
      'Hello, World!'
    }
  }.render
end
