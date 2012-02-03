require 'rubygems'
require 'sinatra'


get '/' do
	erb "Hello, world, at #{Time.now}"
end
