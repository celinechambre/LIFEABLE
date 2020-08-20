class LivesController < ApplicationController
  before_action :set_life, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lives = policy_scope(Life)
    # @lives = Life.all
    # authorize @lives
    # if params[:query].present? # part 4 of the job
    #   @lives = Life.where(“title ILIKE ?“, “%#{params[:query]}%“)
    # else
    #   @lives = Life.all
    # end
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @lives = Life.where(sql_query, query: "%#{params[:query]}%")
    else
      @lives = Life.all
    end

  end

  def new
    @life = Life.new
    authorize @life
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    authorize @life
    if @life.save!
      # Life.create!(title: life_params.title, description: life_params.description, user_id: current_user.id)
      redirect_to life_path(@life)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @life.update(life_params)
      redirect_to @life, notice: 'Your life was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @life.destroy!
    redirect_to lives_path, notice: 'Life was successfully destroyed.'
  end

  private

  def life_params
    params.require(:life).permit(:title, :description, :photo, :city, :job, :lifestyle)
  end

  def set_life
    @life = Life.find(params[:id])
    authorize @life
  end

  def set_user
    @user = current_user
  end
end
