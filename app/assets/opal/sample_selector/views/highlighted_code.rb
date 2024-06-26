class HighlightedCode
  include Glimmer::Web::Component
  
  attribute :language, default: 'ruby'
  attribute :model
  attribute :model_code_attribute # name of attribute on model that holds code string to render
  attribute :float, default: 'initial'
  
  markup {
    div(class: 'code-scrollable-container', style: "float: #{float};") {
      pre {
        @code_element = code(class: "language-#{language}") {
          inner_html <= [model, model_code_attribute,
                          after_read: -> (_) { highlight_code }
                        ]
        }
      }
     
      style {
        r('div.code-scrollable-container') {
          overflow 'scroll'
          width 'calc(100vw - 410px)'
          height '80vh'
          border '1px solid rgb(209, 215, 222)'
          padding '0'
        }
        
        r('div.code-scrollable-container pre') {
          margin '0'
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
  
  def highlight_code
    @code_element.dom_element.removeAttr('data-highlighted')
    # $$ enables interacting with global JS scope, like top-level hljs variable to use highlight.js library
    $$.hljs.highlightAll
    $$.hljs.initLineNumbersOnLoad
  end
end
