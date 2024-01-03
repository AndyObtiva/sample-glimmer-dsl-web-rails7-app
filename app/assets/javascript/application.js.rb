require 'glimmer-dsl-web'

include Glimmer

Document.ready? do
  @root_div = div(id: 'root-container') {
    h1('Glimmer DSL for Web Rails 7 Sample App')
    
    h2('Run a sample or view its code. Refresh page to run another sample.')
    
    table(id: 'samples') {
      tr {
        td('Hello, World!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_world.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_world.rb'
          )
          span(' ) ')
        }
      }
      
      tr {
        td('Hello, Button!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_button.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_button.rb'
          )
          span(' ) ')
        }
      }
      
      tr {
        td('Hello, Form!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_form.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_form.rb'
          )
          span(' ) ')
        }
      }
      
      tr {
        td('Hello, Data-Binding!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_data_binding.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_data_binding.rb'
          )
          span(' ) ')
        }
      }
      
      tr {
        td('Hello, Content Data-Binding!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
          )
          span(' ) ')
        }
      }
      
      tr {
        td('Hello, Input (Date/Time)!')
        td {
          span(' ( ')
          a('Run', href: '#') {
            onclick do |event|
              event.prevent_default
              @root_div.remove
              require 'glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
            end
          }
          span(' | ')
          a('Code',
            target: '_blank',
            href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
          )
          span(' ) ')
        }
      }
    }

    style {
      <<~CSS
        div#root-container {
          text-align: center;
        }
        table#samples {
          margin: 0 auto;
        }
        table tr td {
          text-align: left;
        }
      CSS
    }
  }
  @root_div.render
end
