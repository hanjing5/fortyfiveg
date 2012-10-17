class PagesController < ApplicationController
  def new
  end

  def index
  end

  def search
    @results = WyAll.search(params[:query])
  end
end
