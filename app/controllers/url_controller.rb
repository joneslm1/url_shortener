class UrlController < ApplicationController

  def index
    @urls = Url.all

  end

  def show
  end

  def new
    @url = Url.new
  end


  def create
    @url = Url.new(url_params)


    respond_to do |format|
      if @url.save
        format.html {redirect_to '/'}
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end


private

  def url_params
    params.require(:url).permit(:original_url, :id)
  end


end
