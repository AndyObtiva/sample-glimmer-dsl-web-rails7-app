class SamplesTable
  include Glimmer::Web::Component
  
  attribute :presenter
  
  markup {
    table(class: 'samples') {
      tbody {
        SampleSelectorPresenter::SAMPLES.each do |sample|
          tr {
            td(sample.name)
            
            class_name <= [presenter, :selected_sample,
                            on_read: -> (val) { val == sample ? 'selected' : ''}
                          ]
          
            onclick do |event|
              event.prevent_default
              presenter.selected_sample = sample
            end
          }
        end
        
        tr {
          # handle this sample differently via links to demonstrate visiting outside pages
          td {
            span('Hello, glimmer_component Rails Helper!')
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
        r('table.samples') {
          border_spacing 0
        }
        
        r('table.samples tr td') {
          border '1px solid transparent'
          padding '5px'
          cursor 'default'
        }
        
        r('table.samples tr td:hover') {
          border '1px solid gray'
        }
        
        r('table.samples tr.selected td') {
          border '1px solid lightgray'
          background 'lightblue'
        }
      }
    }
  }
end
