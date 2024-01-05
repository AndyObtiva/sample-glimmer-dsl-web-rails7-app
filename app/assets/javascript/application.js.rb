require_relative 'sample_selector'

Document.ready? do
  SampleSelector.render('div#app-container')
end
