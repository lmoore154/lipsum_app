class Futurama

  def response(num)
    fut_lipsum = "You guys aren't Santa! You're not even robots. How dare you lie in front of Jesus? We'll need to have a look inside you with this camera. WINDMILLS DO NOT WORK THAT WAY! GOOD NIGHT!"
    body_count = num.times.map { fut_lipsum }
    ['200', {'Content-Type' => 'text/html'}, ["#{body_count.join("<br>")}"]]  # <br> because it's on an html page
  end

  def self.call(num)
    new.response(num)
  end

end
