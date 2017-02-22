# require 'active_support'
require 'date'
require_relative 'ad_lipsum'
require_relative 'futurama_lipsum'
require_relative 'tina_lipsum'
# require_relative 'timezone'     #Couldn't find a good way to list valid time zones in a specific enough way to make it work...
                                  #there are a lot of them.

class App

  attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = env["PATH_INFO"]
  end

  def number_of_paragraphs
    num = path.sub(/\/\w+[|\/]/, "")
    num = 1 if num.to_i.zero?
    num.to_i
  end

  def response
    if path == "/lipsums"
      list_of_lipsums
    elsif path == "/current_time"
      current_time
    # elsif path.start_with?("/current_time/")
    #   TimeZone.call(time_zone)
    elsif path.start_with?("/ad")
      ArrestedDevelopment.call(number_of_paragraphs)
    elsif path.start_with?("/futurama")
      Futurama.call(number_of_paragraphs)
    elsif path.start_with?("/tina")
      Tina.call(number_of_paragraphs)
    else
      not_found
    end
  end

  def not_found
    ['404', headers, ["We're sorry. We couldn't that."]]  # Hey, this is what the assignment said.
  end

  def list_of_lipsums
    ['200', headers, ["Defined lipsums include 'ad', 'futurama', and 'tina.'"]]
  end

  def current_time
    current_time = Time.now.strftime("It is currently %H:%M on %B %d, %Y.")
    ['200', headers, ["#{current_time}"]]
  end

  # def time_zone
  #   zone = env["PATH_INFO"].sub(/\/\w+[|\/]/, "").to_s
  # end

  def headers
    {'Content-Type' => 'text/html'}
  end

  def self.call(env)
    new(env).response
  end

end
