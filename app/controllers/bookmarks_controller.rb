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
    if logged_in?
      erb :'bookmarks/create_bookmark'
    else
      redirect to '/login'
    end
  end

  post '/bookmarks' do
    if logged_in?
      if params[:content] == ""
        redirect to "/bookmarks/new"
      else
        @bookmark = current_user.bookmarks.build(title: params[:title], link: params[:link], category: params[:category])
        if @bookmark.save
          redirect to "/bookmarks/#{@bookmark.id}"
        else
          redirect to "/bookmarks/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/bookmarks/:id' do
    if logged_in?
      @bookmark = Bookmark.find_by_id(params[:id])
      erb :'bookmarks/show_bookmark'
    else
      redirect to '/login'
    end
  end

  get '/bookmarks/:id/edit' do
    if logged_in?
      @bookmark = Bookmark.find_by_id(params[:id])
      if @bookmark && @bookmark.user == current_user
        erb :'bookmarks/edit_bookmark'
      else
        redirect to '/bookmarks'
      end
    else
      redirect to '/login'
    end
  end

  patch '/bookmarks/:id' do
    if logged_in?
      if params[:link] == ""
        redirect to "/bookmarks/#{params[:id]}/edit"
      else
        @bookmark = Bookmark.find_by_id(params[:id])
        if @bookmark && @bookmark.user == current_user
          if @bookmark.update(title: params[:title], link: params[:link], category: params[:category])
            redirect to "/bookmarks/#{@bookmark.id}"
          else
            redirect to "/bookmarks/#{@bookmark.id}/edit"
          end
        else
          redirect to '/bookmarks'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/bookmarks/:id/delete' do
    if logged_in?
      @bookmark = Bookmark.find_by_id(params[:id])
      if @bookmark && @bookmark.user == current_user
        @bookmark.delete
      end
      redirect to '/bookmarks'
    else
      redirect to '/login'
    end
  end

end
