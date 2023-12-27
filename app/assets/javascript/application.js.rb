require 'glimmer-dsl-web'

# Enable this and disable everything that follows if you want to load the Hello, World! sample
# require 'glimmer-dsl-web/samples/hello/hello_world.rb'

require 'puts_debuggerer'

include Glimmer

Document.ready? do
  div(parent: '#app-container') {
    label(class: 'greeting') {
      'Hello, World!'
    }
  }.render
end
