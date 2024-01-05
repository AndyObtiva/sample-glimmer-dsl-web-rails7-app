require 'glimmer-dsl-web'

require_relative 'sample_selector/views/back_anchor'

class SampleSelector
  include Glimmer::Web::Component
  
  markup {
    div(id: 'root-container') {
      h2("Run a sample or view a sample's code.")
      
      table(id: 'samples') {
        tr {
          td('Hello, World!')
          td {
            span(' ( ')
            a('Run', href: '#') {
              onclick do |event|
                event.prevent_default
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_world.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_world.rb'
                end
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
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_button.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_button.rb'
                end
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
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_form.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_form.rb'
                end
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
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_data_binding.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_data_binding.rb'
                end
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
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_content_data_binding.rb'
                end
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
          td('Hello, Component!')
          td {
            span(' ( ')
            a('Run', href: '#') {
              onclick do |event|
                event.prevent_default
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_component.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_component.rb'
                end
              end
            }
            span(' | ')
            a('Code',
              target: '_blank',
              href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_component.rb'
            )
            span(' ) ')
          }
        }
        
        tr {
          td('Hello, Glimmer Component Helper!')
          td {
            span(' ( ')
            a('Run', href: '/?address=true&full_name=John%20Doe&street=123%20Main%20St&street2=apt%2012&city=San%20Diego&state=California&zip_code=91911')
            span(' | ')
            a('Code',
              target: '_blank',
              href: 'https://github.com/AndyObtiva/sample-glimmer-dsl-web-rails7-app/blob/master/app/views/welcomes/index.html.erb'
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
                markup_root.remove
                BackAnchor.render
                begin
                  load 'glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
                rescue LoadError # the first time a file is loaded, it raises LoadError and must be required instead
                  require 'glimmer-dsl-web/samples/hello/hello_input_date_time.rb'
                end
              end
            }
            span(' | ')
            a('Code',
              target: '_blank',
              href: 'https://github.com/AndyObtiva/glimmer-dsl-web/blob/master/lib/glimmer-dsl-web/samples/hello/hello_input_date_time.rb',
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
  }
end
