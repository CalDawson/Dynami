class FoodsController < ApplicationController
  def create
    authorize @food
  end
end
