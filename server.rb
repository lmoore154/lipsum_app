require 'rack'
require 'thin'
require_relative 'app'
# app = Proc.new do |env|
#   # Finds the num of paragraphs requested, or sets it to 1
#   num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
#   num = 1 if num.to_i.zero?
# end

#   # Replace the code below with your code (and remove this comment)
#   ['200', {'Content-Type' => 'text/html'}, [env.inspect]]
#
# end

# @prompt = TTY::Prompt.new
#
# response = prompt.select("Choose your lipsum:", %w(ArrestedDevelopment Futurama Lorem))
#
# if response == "ArrestedDevelopment"
#   app = ArrestedDevelopment
# elsif response == "Futurama"
#   app = Futurama
# elsif response == "Lorem"
#   app = Lorem
# end
app = App

# Rack::Handler::WEBrick.run app

Rack::Handler::Thin.run app
