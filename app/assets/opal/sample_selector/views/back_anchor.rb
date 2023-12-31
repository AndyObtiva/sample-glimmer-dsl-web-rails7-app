require 'glimmer-dsl-web'

class BackAnchor
  include Glimmer::Web::Component
  
  markup {
    a('<< Back To Samples', href: '#', style: 'display: block; margin-bottom: 10px;') { |back_anchor|
      onclick do
        back_anchor.remove
        Element['body > *'].to_a[2..].each(&:remove)
        SampleSelector.render(parent: ".sample_selector")
      end
    }
  }
end
