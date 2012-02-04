require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite:./db/page.db')

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

#create
get '/admin/create' do
  erb :create_form
end

get '/admin/edit/:id' do
  # fill form
  @page = Page.get(params[:id])

  erb :edit_form
end

post '/admin/edit/:id' do
  params[:id]
end

post '/admin/create' do
 # @page = Page.create(
 #   :name => params[:name]
 # )
 params.delete 'submit'
 @page = Page.create(params) 
 @page.id.inspect
end

get '/admin/pages' do
  Page.all.inspect
end
get '/' do
  @page = Page.get(1)
  erb :page
  #erb "Hello, world, at #{Time.now}"
end
