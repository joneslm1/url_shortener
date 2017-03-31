class UrlController < ApplicationController

  def index
    @urls = Url.all

  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def redirect
    redirect_to(Url.find(params[:id]).original_url)
  end

  def create
    @url = Url.new(url_params)


    respond_to do |format|
      if @url.save
        format.html {redirect_to '/'}
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new, notice: 'Need a url starting with http:// or https:// please!' }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  @url = Url.find(params[:id])
  @url.destroy
  respond_to do |format|
    format.html { redirect_to "/index"}
    format.json { head :no_content }
  end
end



private

  def url_params
    params.require(:url).permit(:original_url, :id)
  end


end
