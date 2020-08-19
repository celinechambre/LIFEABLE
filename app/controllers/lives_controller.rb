class LivesController < ApplicationController
  before_action :set_life, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lives = Life.all
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    if @life.save!
      # Life.create!(title: life_params.title, description: life_params.description, user_id: current_user.id)
      redirect_to life_path
    else
      render :new
    end
  end

  def new
    @life = Life.new
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

   def set_life
    @life = Life.find(params[:id])
  end
end
