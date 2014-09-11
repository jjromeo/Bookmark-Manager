require 'haml'
require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'application_helper'

class BookmarkManager < Sinatra::Base
	include ApplicationHelper

	set :views, Proc.new { File.join(root, "..", "views") }
	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Partial
	set :partial_template_engine, :haml

	use Rack::Flash
	use Rack::MethodOverride
end
