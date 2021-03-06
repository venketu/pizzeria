class PizzeriasController < ApplicationController
  before_action :set_pizzeria, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @pizzerias = Pizzeria.search(params[:search])
    else
      @pizzerias = Pizzeria.all
    end
    avg_reviews
  end

  def index
    @pizzerias = Pizzeria.all
    avg_reviews
  end

  def avg_reviews
    @avg_review = Hash.new
    @pizzerias.each do |pizzeria|
      @reviews = Review.where(pizzeria_id: pizzeria.id).order("created_at DESC")

      if @reviews.blank?
        @avg_review[pizzeria.id] = 0
      else
        @avg_review[pizzeria.id] = @reviews.average(:rating).round(2)
      end
    end
  end

  def show
    @reviews = Review.where(pizzeria_id: @pizzeria.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @pizzeria = current_user.pizzerias.build
  end

  def edit
  end

  def create
    @pizzeria = current_user.pizzerias.build(pizzeria_params)

    respond_to do |format|
      if @pizzeria.save
        format.html { redirect_to @pizzeria, notice: 'Pizzeria was successfully created.' }
        format.json { render :show, status: :created, location: @pizzeria }
      else
        format.html { render :new }
        format.json { render json: @pizzeria.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pizzeria.update(pizzeria_params)
        format.html { redirect_to @pizzeria, notice: 'Pizzeria was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizzeria }
      else
        format.html { render :edit }
        format.json { render json: @pizzeria.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pizzeria.destroy
    respond_to do |format|
      format.html { redirect_to pizzerias_url, notice: 'Pizzeria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pizzeria
      @pizzeria = Pizzeria.find(params[:id])
    end

    def pizzeria_params
      params.require(:pizzeria).permit(:name, :description, :address, :owner, :phone, :image)
    end
end
