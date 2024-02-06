require 'glimmer-dsl-web'

require_relative 'sample_selector/models/sample_selector_presenter'
require_relative 'sample_selector/views/back_anchor'

class SampleSelector
  include Glimmer::Web::Component
  
  before_render do
    @presenter = SampleSelectorPresenter.new
  end
  
  after_render do
    @presenter.selected_sample = 'hello_world'
  end
  
  markup {
    div(id: 'root-container') {
      h2("Run a sample or view a sample's code.", style: 'text-align: center;')
      
      div(id: 'code-scrollable-container') {
        div(id: 'code-container') {
          pre {
            code(class: "language-ruby") { |code_element|
              inner_html <= [@presenter, :selected_sample_code,
                              after_read: -> (_) {
                                code_element.dom_element.removeAttr('data-highlighted')
                                $$.hljs.highlightAll
                                $$.hljs.initLineNumbersOnLoad
                              }
                            ]
            }
          }
        }
      }
      
      table(id: 'samples') {
        SampleSelectorPresenter::SAMPLES.each do |sample|
          tr {
            class_name <= [@presenter, :selected_sample,
                            on_read: -> (val) { val == sample ? 'selected' : ''}
                          ]
          
            td(SampleSelectorPresenter::SAMPLE_NAMES[sample])
            td {
              span(' ( ')
              a('Run', href: '#') {
                onclick do |event|
                  event.prevent_default
                  markup_root.remove
                  BackAnchor.render
                  @presenter.load_sample(sample)
                  # TODO add this link as a button on top of the table
                end
              }
              span(' | ')
              a('Code', href: '#') {
                onclick do |event|
                  event.prevent_default
                  @presenter.selected_sample = sample
                end
              }
              span(' ) ')
            }
          }
        end
        
        tr {
          # TODO data-bind selection
          # handle links differently, trying to do so with presenter
          td('Hello, glimmer_component Rails Helper!')
          td {
            span(' ( ')
            a('Run', "data-turbo": "false", href: '/?address=true&full_name=John%20Doe&street=123%20Main%20St&street2=apt%2012&city=San%20Diego&state=California&zip_code=91911')
            span(' | ')
            a('Code',
              target: '_blank',
              href: 'https://github.com/AndyObtiva/sample-glimmer-dsl-web-rails7-app/blob/master/app/views/welcomes/_address_page.html.erb'
            )
            span(' ) ')
          }
        }
      }
                  
      style {
        r('div#code-scrollable-container') {
          float 'right'
          overflow 'scroll'
          width 'calc(100vw - 410px)'
          height '80vh'
          border '1px solid rgb(209, 215, 222)'
          padding '0'
        }
        
        r('div#code-scrollable-container pre') {
          margin '0'
        }
        
        r('table#samples tr.selected') {
          background 'lightblue'
        }
        
        r('.hljs-ln td.hljs-ln-line.hljs-ln-numbers') {
          user_select 'none'
          text_align 'center'
          color 'rgb(101, 109, 118)'
          padding '3px 30px'
        }
      }
    }
  }
end
