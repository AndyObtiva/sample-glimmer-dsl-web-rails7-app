require 'glimmer-dsl-web'

# Below is how we load the Sample Selector without using the glimmer_component Rails helper
# If you want to try to enable, make sure to disable glimmer_component call in app/views/welcomes/index.html.erb
# Also, enable <%#= javascript_include_tag "application", "data-turbolinks-track": "reload" %> in application.html.erb layout
#
# require_relative 'sample_selector'
#
# Document.ready? do
#   SampleSelector.render('div#app-container')
# end
