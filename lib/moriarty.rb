require_relative 'moriarty/cli.rb'

require 'rest-client'
require 'colorize'
require 'nokogiri'

#
# Main class to get data and execute request
#
# Methods: [ #new, #go, #success?, #make_url, #url=, #user= ]
#
# Attributes:
#  :user     = :moriarty     => 'moriarty'
#  :url      = 'example.com' => 'https://example.com/'
#  :response => [.code, .headers, .body]  -> restclient#get
#  :html     => scrapped HTML if success? -> nokogiri#html
#

class Moriarty

  attr_reader :url, :user, :response, :html

  # Set username and site for search request
  # exclude 'https', #make_url will add it for you
  # To use different protocol, set it as third parameter
  #
  # @jim = Moriarty.new( 'moriarty', 'example.com', :http )
  #  => @jim.user == 'moriarty'
  #  => @jim.url  == 'http://example.com/'

  def initialize( name = '', site = 'github.com', type = :https )
    @user = name.to_s
    @url  = make_url site, type
  end

  # execute request (args are optional)
  # @jim.go site: 'github.com', user: 'mynickname'
  #  => true/false
  #  -> @jim.response (.code, .headers, .body)
  #  -> @jim.html (page HTML if request success)

  def go( opt = {} )
    opt[:user] ||= @user
    url = opt[:site].nil? ? @url : make_url(opt[:site])
    uri = url + opt[:user]
    @response = RestClient.get uri
    @html     = Nokogiri::HTML @response
    return @success = true
    rescue
    return @success = false
  end

  alias search go

  # create URL from site name, add 'https' if needed
  # @jim.make_url 'instagram.com'
  #  => 'https://instagram.com/'

  def make_url( link, prot = :https )
    prot = nil if link.to_s.start_with? prot.to_s
    url  = prot.nil? ? link.to_s : prot.to_s + '://' + link.to_s
    url += '/' unless url.end_with?('/')
    return url
  end

  # Set URL from site name and protocol(optional)
  # @jim.url = 'github.com'
  #  => @jim.url == 'https://github.com'

  def url=( link, start = :https )
    @url = make_url link, start
  end

  # Set username from string or :symbol
  # @jim.user = :moriarty
  #  => @jim.user == 'moriarty'

  def user=( name )
    @user = name.to_s
  end

  # Check does request succeeded or not
  # @jim.success?
  #  => true/false

  def success?
    @success == true
  end
end
