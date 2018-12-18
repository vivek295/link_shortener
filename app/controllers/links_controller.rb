class LinksController < ApplicationController

  def new

  end

  def create
    @link = Link.new(link_params)
    @link.trim_url
    @link.generate_short_url
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_to do |format|
      format.html { }
      format.js {}
    end
  end

  def show
    @link = Link.find_by(short_url: params[:short_url])
    if @link
      redirect_to @link.original_url
    end
  end

  def index
    @links = Link.all
  end

  private
    def link_params
      params.permit(:original_url)
    end
end