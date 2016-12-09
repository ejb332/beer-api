class Api::V2::BeersController < ApplicationController
  def index
    @beers = Beer.all
    render "index.json.jbuilder"
  end

  def show
    @beer = Beer.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @beer = Beer.new(
      name: params[:name],
      style: params[:style],
      hop: params[:hop],
      yeast: params[:yeast],
      malts: params[:malts],
      ibu: params[:ibu],
      alcohol: params[:alcohol],
      blg: params[:blg]
      )
    @beer.save
    render "show.json.jbuilder"
  end

  def update
    beer_id = params[:id]
    @beer = Beer.find_by(id: beer_id)
    @beer.name = params[:name] || @beer.name
    @beer.style = params[:style] || @beer.style
    @beer.hop = params[:hop] || @beer.hop
    @beer.yeast = params[:yeast] || @beer.yeast
    @beer.malts = params[:malts] || @beer.malts
    @beer.ibu = params[:ibu] || @beer.ibu
    @beer.alcohol = params[:alcohol] || @beer.alcohol
    @beer.blg = params[:blg] || @beer.blg
    @beer.save
    render "show.json.jbuilder"
  end

  def destroy
    beer_id = params[:id]
    @beer = Beer.find_by(id: beer_id)
    @beer.destroy
    render json: { message: "Beer successfully removed!" }
  end
end
