Rails.application.routes.draw do
  get "/beers" => "beers#index"
  get "/beers/:id" => "beers#show"
end
