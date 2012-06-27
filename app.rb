require 'sinatra'

require 'woothee'
require 'json'

get '/' do
  if params[:x]
    params[:x]
  else
    'Hello World'
  end
end

get '/parse' do
  Woothee.parse(params[:agent] || '').to_json
end
