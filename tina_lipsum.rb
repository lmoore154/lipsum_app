class Tina

  def response(num)
    tina_lipsum = "I've been using the toilet like an idiot. Thank you zombie boyfriends. Not if you're a fish. This is where I thrash. Here's a bunch of numbers. They may look random but they're my phone number. I guess she doesn't like wearing clothes."
    body_count = num.times.map { tina_lipsum }
    ['200', {'Content-Type' => 'text/html'}, ["#{body_count.join("<br>")}"]]
  end

  def self.call(num)
    new.response(num)
  end

end
