class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @pet.destroy

    redirect_to pets_path
  end

  private

  # FILTER
  def set_pet
    @pet = Pet.find(params[:id])
  end

  # STRONG PARAMS
  def pet_params
    params.require(:pet).permit(:color, :location, :found_on, :species)
  end
end

# PARAMS
# 1. to access dynamic values from the URL
# 2. to access information that is coming from the form
