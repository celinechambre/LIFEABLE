class LivesController < ApplicationController
  before_action :set_life, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # @lives = policy_scope(Life)
    @lives = Life.all
    # authorize @lives
  end

  def create
    @life = Life.new
    @life.user = current_user
    authorize @life
  end

  def new
    @life = Life.new(life_params)
    authorize @life
    @life.save
  end

  def show
  end

  def edit
  end

  def update
    if @life.update(life_params)
      redirect_to @life, notice: 'YOur life was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @live.destroy!
    redirect_to lives_url, notice: 'Life was successfully destroyed.'
  end

  private

  def life_params
    params.require(:life).permit(:title, :description)
  end

   def set_life
    @life = Life.find(params[:id])
  end
end
