require 'omdbapi'

class TitlesController < ApplicationController
  def index

  end

  def search
    search = params[:q]
    unless search == nil
      results = OMDB.search("#{search}")
      if results == {:response=>"False", :error=>"Movie not found!"}
        flash[:alert] = "No Matches Found! Try again"
        redirect_to '/titles/search'
      elsif results.class == Hash && results == {:response=>"False", :error=>"Object reference not set to an instance of an object."}
        flash[:alert] = "Can't Search Nothing..."
        redirect_to '/titles/search'
      elsif results.class == Hash && results != {:response=>"False", :error=>"Movie not found!"}
        @movies = [results]
      else
        @movies = results
      end
    end
  end

  def show
    @title = Title.find(params[:id])
    @review = @title.reviews.new

  end

  def create
    @title = Title.new(params[:title])
  end
end
