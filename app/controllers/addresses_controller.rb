class AddressesController < ApplicationController
before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def show
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to :show
    else
      render :new
    end  
  end  

  def edit
    
  end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      render :edit
    end 
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :number, :zipcode)
  end

end
