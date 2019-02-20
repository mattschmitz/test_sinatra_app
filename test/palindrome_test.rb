require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_form_submition
    post '/check', phrase: 'not a palindrome'
    assert_includes doc(last_response).at_css('p').content, "isn't a palindrome"
    post '/check', phrase: "Able was I, ere I saw Elba."
    assert_includes doc(last_response).at_css('p').content, "is a palindrome"
    assert doc(last_response).at_css('form')
  end
end