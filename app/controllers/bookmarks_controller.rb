class BookmarksController < ApplicationController
  get '/bookmarks' do
    if logged_in?
      @bookmarks = Bookmark.all
      erb :'bookmarks/bookmarks'
    else
      redirect to '/login'
    end
  end

  get '/bookmarks/new' do

  end

  post '/bookmarks' do

  end

  get '/bookmarks/:id' do

  end

  get '/bookmarks/:id/edit' do

  end

  patch '/bookmarks/:id' do

  end

  delete '/bookmarks/:id/delete' do
  end

end
