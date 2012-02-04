require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite:./db/page.db')

class Page
  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :alias,            String
  property :short,            Text
  property :full,             Text
  property :seo_title,        String
  property :seo_keywords,     String
  property :seo_description,  String
  property :created_at,       DateTime
  property :updated_at,       DateTime
end

DataMapper.finalize
#DataMapper.auto_migrate!

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
  @page = Page.get(params[:id])
  params.delete 'submit'
  params.delete 'id'
  params.delete 'splat'
  params.delete 'captures' 
  @page.attributes = params
  @page.save
  #redirect '/admin/pages'
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
