class BeersController < ApplicationController
  def index
    @beers = Beer.all
    render "index.json.jbuilder"
  end

  def show
    @beer = Beer.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
