require 'minitest/autorun'
require 'rack/test'
require_relative 'app'

class AppTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    App
  end

  def test_tina_lipsum_returns_two_times_when_specified
    get "/tina/2"
    assert last_response.ok?
    assert_equal 2, last_response.body.split("<br>").count
  end

  def test_futurama_lipsum_returns_without_a_specified_number
    get "/futurama"
    assert last_response.ok?
    assert_equal "You guys aren't Santa! You're not even robots. How dare you lie in front of Jesus? We'll need to have a look inside you with this camera. WINDMILLS DO NOT WORK THAT WAY! GOOD NIGHT!", last_response.body
  end

  def test_ad_lipsum_returns_four_times_when_specified
    get "/ad/4"
    assert last_response.ok?
    assert_equal 4, last_response.body.split("<br>").count
  end

  def test_lipsums_path_returns_list_of_lipsums
    get "/lipsums"
    assert last_response.ok?
    assert_equal "Defined lipsums include 'ad', 'futurama', and 'tina.'", last_response.body
  end

  def test_returns_not_found_when_path_does_not_match_given_options
    get "/wtblindabelcherlipsums"
    refute last_response.ok?
    assert_equal 404, last_response.status
  end

  def test_current_time_and_date_are_returned
    get "/current_time"
    assert last_response.ok?
    assert_equal 1, Array(last_response.body).count
  end

end
