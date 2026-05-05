ConferenceTalk.find_or_create_by!(title: 'JRuby Updates') do |conference_talk|
  conference_talk.time = '09:00AM - 10:30AM'
  conference_talk.speaker = 'Chuck Norris'
  conference_talk.description = 'JRuby enables using Ruby from the Java Virtual Machine. We will cover the latest bells and whistles in JRuby in this talk.'
  conference_talk.bio = 'JRuby Ninja'
end
ConferenceTalk.find_or_create_by!(title: 'Building your own LLM Agent in Ruby') do |conference_talk|
  conference_talk.time = '11:00AM - 12:30PM'
  conference_talk.speaker = 'Bob Hicks'
  conference_talk.description = 'Ruby is a wonderful language for building AI agents, not just business applications! We will go over how to build your own LLM agent in Ruby.'
  conference_talk.bio = 'AI PhD'
end
ConferenceTalk.find_or_create_by!(title: 'Opal Is Shiny!!!') do |conference_talk|
  conference_talk.time = '02:00PM - 03:30PM'
  conference_talk.speaker = 'Steven Harris'
  conference_talk.description = 'Opal is a Fukuoka award winning Ruby to JavaScript transpiler that enables using Ruby in the Frontend of Rails'
  conference_talk.bio = 'Opal Master & Comp Sci Grad'
end
ConferenceTalk.find_or_create_by!(title: 'Desktop App in 10 minutes') do |conference_talk|
  conference_talk.time = '04:00PM - 05:30PM'
  conference_talk.speaker = 'Jordan Haines'
  conference_talk.description = 'Build a desktop application in 10 minutes with the amazing simplicity of Ruby!'
  conference_talk.bio = 'RubyConf Speaker'
end
