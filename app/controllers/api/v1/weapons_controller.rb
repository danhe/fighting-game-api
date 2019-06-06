class Api::V1::WeaponsController < ApplicationController
  before_action :load_resource

  # GET /api/v1/characters/:character_id/weapons
  def index
    render json: @weapon, each_serializer: Api::V1::WeaponSerializer, status: :ok
  end

  private

  def load_resource
    @character = Character.find(params[:character_id])
    # return all weapons that the fighter could buy
    @weapon = Weapon.where(
      'experience_price <= ?', @character.current_experience
    ).order(:experience_price)
  rescue ActiveRecord::RecordNotFound
    not_found!
  end
end
