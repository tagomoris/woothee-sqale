require 'sinatra'
require 'haml'

require 'woothee'

require 'cgi'
require 'json'

configure do
  set :haml, {:escape_html => true}
end

get '/' do
  @parsed = if params[:a] then Woothee.parse(params[:a])
            else nil
            end
  @agent = request.user_agent
  @agente = CGI.escape(@agent)
  haml :index
end

get '/json', :provides => ['json'] do
  Woothee.parse(params[:a] || '').to_json
end
