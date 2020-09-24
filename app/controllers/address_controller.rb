class AddressController < ApplicationController
  def index
  end

  def new
    @donation = ItemDonation.new
  end
 
  def create
    @donation = ItemDonation.new(donation_params)
    @donation.save
  end
 
  private
 
  def donation_params
   params.require(:item_donation).permit(:price, :item_id, :postal_code, :area_id, :city, :address, :phone_number, :building)
  end

end
