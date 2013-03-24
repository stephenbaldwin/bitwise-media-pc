#! /usr/bin/env ruby

require 'rubygems'
require 'sinatra/cross_origin'
require 'json'
require 'hallon'
require 'hallon-openal'

session = Hallon::Session.initialize(IO.read('./spotify_appkey.key'))
session.login!('adamjhicks75', 'pololo')

set :server, :thin
set :static, true
get '/' do
  track = Hallon::Track.new("spotify:track:1ZPsdTkzhDeHjA5c2Rnt2I")
  track.load

  player = Hallon::Player.new(Hallon::OpenAL)
  player.play!(track)
  "hello world! #{params[:action]}"
end
