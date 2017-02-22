class ArrestedDevelopment

  def response(num)
    ad_lipsum = "First place chick is hot, but has an attitude, doesn't date magicians."
    body_count = num.times.map { ad_lipsum }
    ['200', {'Content-Type' => 'text/html'}, ["#{body_count.join("<br>")}"]]
  end

  def self.call(num)
    new.response(num)
  end

end
