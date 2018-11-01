class DosesController < ApplicationController

  def index
    @doses = Dose.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new

  end

  def create
    @dose = Dose.create(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else render :new
      end
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
