require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
 include Rack::Test::Methods

  TITLE = "Toy Sinatra App"
  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    document = doc(last_response)
    assert document.at_css('h1')
    assert document.at_css('nav')
    title_content = document.at_css('title').content
    assert_equal "#{TITLE} | Home", title_content  
  end

  def test_about
    get '/about'
    assert last_response.ok?
    document = doc(last_response)
    assert document.at_css('h1')
    title_content = document.at_css('title').content
    assert_equal "#{TITLE} | About", title_content
  end

  def test_palindrome
    get '/palindrome'
    assert last_response.ok?
    document = doc(last_response)
    assert document.at_css('h1')
    title_content = document.at_css('title').content
    assert_equal "#{TITLE} | Palindrome", title_content
  end

end
