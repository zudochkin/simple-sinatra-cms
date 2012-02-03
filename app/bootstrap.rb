require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'])

class Page
  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :short,            Text
  property :full,             Text
  property :seo_title,        String
  property :seo_keywords,     String
  property :seo_description,  String
  property :created_at,       DateTime
end

DataMapper.auto_migrate!


get '/' do
  erb "Hello, world, at #{Time.now}"
end
