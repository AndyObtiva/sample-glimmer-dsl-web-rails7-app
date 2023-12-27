require 'glimmer-dsl-web'
require 'puts_debuggerer'

include Glimmer

Document.ready? do
  div(root: '#app-container') {
    label(class: 'greeting') {
      'Hello, World!'
    }
  }.render
end
