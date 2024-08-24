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
                          after_read: -> { highlight_code }
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
    scroll_to_glimmer_code
  end
  
  def scroll_to_glimmer_code
    Async::Timeout.new 50 do
      table_rows = @code_element.dom_element.find('table tr')
      lines = table_rows.map(&:text)
      glimmer_code_occurrence = lines.each_with_index.select {|line, i| line.include?('include Glimmer')}.last
      if glimmer_code_occurrence
        glimmer_code_index_delta = glimmer_code_occurrence[0].include?('include Glimmer::Web::Component') ? 2 : 1
        glimmer_code_index = [glimmer_code_occurrence[1] - glimmer_code_index_delta, 0].max
        glimmer_code_scroll_top = ((markup_root.scroll_height.to_f - 26) / lines.size.to_f) * glimmer_code_index
        markup_root.scroll_top = glimmer_code_scroll_top
      end
    end
  end
end
