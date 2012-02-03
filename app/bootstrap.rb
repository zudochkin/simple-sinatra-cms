require 'rubygems'
require 'sinatra'
require 'data_mapper'

get '/' do
	erb "Hello, world, at #{Time.now}"
end
