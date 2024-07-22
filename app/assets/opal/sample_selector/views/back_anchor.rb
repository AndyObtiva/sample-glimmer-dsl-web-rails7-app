require 'glimmer-dsl-web'

class BackAnchor
  include Glimmer::Web::Component
  
  markup {
    a('<< Back To Samples', href: '#', style: 'display: block; margin-bottom: 10px;') { |back_anchor|
      onclick do
        Glimmer::Web::Component.remove_all_components
        Element['body > *'].to_a[2..].each(&:remove) # this is needed for non-component samples
        SampleSelector.render(parent: ".sample_selector")
      end
    }
  }
end
