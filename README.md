# Sample Glimmer DSL for Web Rails 7 App
## [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 /> Glimmer DSL for Web Application](https://github.com/AndyObtiva/glimmer-dsl-web)

This is a sample app built with [Glimmer DSL for Web](https://github.com/AndyObtiva/glimmer-dsl-web) (Ruby in the Browser Web GUI Library).

## Setup Instructions

Note that you need Ruby 3.2.2 to run this project.

This is a standard Rails app. As such, you may setup locally by cloning the repository and running the following commands from inside the app directory:
- `bundle`
- `rails db:migrate`
- `rails s`

Visit localhost:3000 in the web browser and You should see a Sample Selector app.

![Sample Screenshot](/sample-glimmer-dsl-web-rails7-app.gif)

The Sample Selector Single-Page Application Frontend is written in Ruby using [Glimmer DSL for Web](https://github.com/AndyObtiva/glimmer-dsl-web) in this file:

[app/assets/opal/sample_selector.rb](/app/assets/opal/sample_selector.rb)

It is loaded from an ERB View using the `glimmer_component` Rails helper:

[app/views/welcomes/index.html.erb](/app/views/welcomes/index.html.erb)

Note that if you are upgrading your setup by pulling a newer commit of this project and re-running `bundle` (or `bundle update`), then before running `rails s`, you should also clear the Opal cache as follows (or else you would get an error about missing files from older versions of gems):

```
rm -rf tmp/cache
```

![Todo MVC](https://github.com/AndyObtiva/glimmer-dsl-web/raw/master/images/glimmer-dsl-web-samples-regular-todo-mvc.gif)

## License

[MIT](LICENSE.txt)

Copyright (c) 2023-2024 Andy Maleh. See [LICENSE.txt](LICENSE.txt) for further details.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built with [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library)
