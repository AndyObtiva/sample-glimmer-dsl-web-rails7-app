require 'glimmer-dsl-opal'
require 'puts_debuggerer'

include Glimmer
      
shell {
  grid_layout 2, true
  
  label(:center) {
    layout_data(:fill, :center, true, false) {
      horizontal_span 2
    }
    text 'Sample Glimmer DSL for Opal Rails 7 App'
    font height: 30
  }

  label(:center) {
    layout_data(:fill, :center, true, false) {
      horizontal_span 2
    }
    text 'Click on a sample to load. Refresh page to load another sample.'
    font height: 20
  }

    button {
    text 'Hello, Arrow!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_arrow'
    end
  }
  button {
    text 'Hello, Browser!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_browser'
    end
  }
  button {
    text 'Hello, Button!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_button'
    end
  }
  button {
    text 'Hello, Canvas!'
    font height: 20

    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_canvas'
    end
  }
  button {
    text 'Hello, C Combo!'
    font height: 20

    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_c_combo'
    end
  }
  button {
    text 'Hello, C Tab!'
    font height: 20

    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_c_tab'
    end
  }
  button {
    text 'Hello, Checkbox!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_checkbox'
    end
  }
  button {
    text 'Hello, Checkbox Group!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_checkbox_group'
    end
  }
  button {
    text 'Hello, Combo!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_combo'
    end
  }
  button {
    text 'Hello, Composite!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_composite'
    end
  }
  button {
    text 'Hello, Computed!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_computed'
    end
  }
  button {
    text 'Hello, Cursor!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_cursor'
    end
  }
  button {
    text 'Hello, Custom Widget!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_custom_widget'
    end
  }
  button {
    text 'Hello, Custom Shell!'
    font height: 20

    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_custom_shell'
    end
  }
  button {
    text 'Hello, Date Time!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_date_time'
    end
  }
  button {
    text 'Hello, Dialog!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_dialog'
    end
  }
  button {
    text 'Hello, Group!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_group'
    end
  }
  button {
    text 'Hello, Label!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_label'
    end
  }
  button {
    text 'Hello, Layout!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_layout'
    end
  }
  button {
    text 'Hello, List Single Selection!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_list_single_selection'
    end
  }
  button {
    text 'Hello, List Multi Selection!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_list_multi_selection'
    end
  }
  button {
    text 'Hello, Menu Bar!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_menu_bar'
    end
  }
  button {
    text 'Hello, Message Box!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_message_box'
    end
  }
  button {
    text 'Hello, Pop Up Context Menu!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_pop_up_context_menu'
    end
  }
  button {
    text 'Hello, Print!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_print'
    end
  }
  button {
    text 'Hello, Progress Bar!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_progress_bar'
    end
  }
  button {
    text 'Hello, Radio!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_radio'
    end
  }
  button {
    text 'Hello, Radio Group!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_radio_group'
    end
  }
  button {
    text 'Hello, Scale!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_scale'
    end
  }
  button {
    text 'Hello, Slider!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_slider'
    end
  }
  button {
    text 'Hello, Spinner!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_spinner'
    end
  }
  button {
    text 'Hello, Tab!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_tab'
    end
  }
  button {
    text 'Hello, Table!'
    font height: 20
    
    on_widget_selected do
      Glimmer::SWT::DisplayProxy.open_custom_shells_in_current_window = true
      require 'glimmer-dsl-opal/samples/hello/hello_table'
      
      # The following is demonstrating styling typically done by web designers in a stylesheet
      Element['.shell'].css('justify-content', 'center')
    end
  }
  button {
    text 'Hello, Text!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_text'
    end
  }
  button {
    text 'Hello, World!'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/hello/hello_world'
    end
  }
  button {
    text 'Contact Manager'
    font height: 20
    
    on_widget_selected do
      Glimmer::SWT::DisplayProxy.open_custom_shells_in_current_window = true
      require 'glimmer-dsl-opal/samples/elaborate/contact_manager'
    end
  }
  button {
    text 'Login'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/elaborate/login'
    end
  }
  button {
    text 'Tic Tac Toe'
    font height: 20
    
    on_widget_selected do
      Glimmer::SWT::DisplayProxy.open_custom_shells_in_current_window = true
      require 'glimmer-dsl-opal/samples/elaborate/tic_tac_toe'
      
      # The following is demonstrating styling typically done by web designers in a stylesheet
      Element['.shell'].css('width', 150)
      Element['.shell'].css('height', 178)
    end
  }
  button {
    text 'User Profile'
    font height: 20
    
    on_widget_selected do
      require 'glimmer-dsl-opal/samples/elaborate/user_profile'
  
      # The following is demonstrating styling typically done by web designers in a stylesheet
      Element['.group'].css('height', 'auto')
    end
  }
  button {
    text 'Tetris'
    font height: 20
    
    on_widget_selected do
      Glimmer::SWT::DisplayProxy.open_custom_shells_in_current_window = true
      require 'glimmer-dsl-opal/samples/elaborate/tetris'
    end
  }
  button {
    text 'Weather'
    font height: 20
    
    on_widget_selected do
      Glimmer::SWT::DisplayProxy.open_custom_shells_in_current_window = true
      require 'glimmer-dsl-opal/samples/elaborate/weather'
    end
  }
}.open
