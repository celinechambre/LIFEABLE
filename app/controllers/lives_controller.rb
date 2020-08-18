class LivesController < ApplicationController

  def index
    @lives = Life.all
  end

  def create
    @life = Life.new
  end

  def new
    @life = Life.new(life_params)
    @life.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def life_params
    params.require(:life).permit(:title, :description)
  end
end
