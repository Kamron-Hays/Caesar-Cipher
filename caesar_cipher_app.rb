require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher'

enable :sessions

get '/' do
  erb :index
end

post '/' do
  if !params["input"].empty?
    session[:cipher] = caesar_cipher(params["input"], params["shift"].to_i)
  else
    session[:cipher] = nil
  end

  # Initiate a GET request to display the updated state.
  redirect "/"
end
