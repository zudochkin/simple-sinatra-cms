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

@page = Page.create(
  :name => 'name',
  :short => 'short',
  :full => 'full',
  :seo_title => 'seo_title',
  :seo_keywords => 'seo_keywords',
  :seo_description => 'seo_description',
  :created_at => Time.now
)

@page.save



get '/' do
  erb "Hello, world, at #{Time.now}"
end
