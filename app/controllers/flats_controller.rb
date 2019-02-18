require 'open-uri'

class FlatsController < ApplicationController
  URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

  # Makes sure that the method `set_flats` is called everytime a new method is called by the routes.
  # This allows all methods to have the @flats variable at their disposal.
  before_action :set_flats

  def index
  end

  def show
    # First, we find the id from the params. This comes in a string, so we have to manually turn it into an integer
    @flat_id = params[:id].to_i
    # Second, we make sure that we find the specific flat whose 'id' is the same as the number we get from the params
    # --> dif between `find` and `select` is that find retreives the first element that fits that condition, whereas `select` returns an array with *all* the elements that fit the condition passed in the block.
    @flat = @flats.find { |flat| flat["id"] == @flat_id }
  end

  private

  def set_flats
    @flats = JSON.parse(open(URL).read)
  end
end
