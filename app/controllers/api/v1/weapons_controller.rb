class Api::V1::WeaponsController < ApplicationController
  def index
    @weapon = Weapon.all
    render json: @weapon, each_serializer: Api::V1::WeaponSerializer
  end
end
