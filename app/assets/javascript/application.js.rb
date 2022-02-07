require 'glimmer-dsl-opal' # brings opal and other dependencies automatically

# Add more require-statements or Glimmer GUI DSL code

include Glimmer

shell {
  fill_layout
  text 'Example to confirm setup is working'
  
  label {
    text "Welcome to Glimmer DSL for Opal!"
    foreground :red
    font height: 24
  }
}.open
