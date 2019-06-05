# FightingsController
class Api::V1::FightingsController < Api::V1::BaseController
  before_action :load_resource

  # GET /api/v1/fightings
  def index
    render json: @fighting, each_serializer: Api::V1::FightingSerializer, status: :ok
  end

  # POST /api/v1/characters
  def create
    if @fighting.save
      @fighting.start
      render json: @fighting, serializer: Api::V1::FightingSerializer, status: :ok
    else
      invalid_resource!(@fighting.errors.full_messages)
    end
  end

  private

  # Before action to load resource
  def load_resource
    case params[:action].to_sym
    when :index
      @fighting = Fighting.all
    when :create
      if the_same_fighters?
        raise ActionController::ParameterMissing, 'Invalid parameters'
      end

      @fighting = Fighting.new(create_params)
    end
  rescue ActionController::ParameterMissing
    missing_params!
  end

  # Create strong params
  def create_params
    params.permit(:fighter_one_id, :fighter_two_id)
  end

  # When having two same fighters in a fighting
  def the_same_fighters?
    create_params[:fighter_one_id] == create_params[:fighter_two_id]
  end
end
