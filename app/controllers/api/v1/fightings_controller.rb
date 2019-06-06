# FightingsController
class Api::V1::FightingsController < Api::V1::BaseController
  before_action :load_resource

  # GET /api/v1/fightings
  def index
    render json: @fighting, each_serializer: Api::V1::FightingSerializer, status: :ok
  end

  # POST /api/v1/fightings
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
      @fighting = Fighting.all.order(created_at: :desc)
    when :create
      raise ActionController::ParameterMissing, 'Too many fighters' if too_many_fighters?
      raise ActionController::ParameterMissing, 'A fighter can NOT fight with himself' if the_same_fighters?

      @fighting = Fighting.new(normalized_fighting_params)
    end
  rescue ActionController::ParameterMissing
    missing_params!
  end

  # Create strong params
  def fighting_params
    params.require(:fighting)
  end

  # When having two same fighters in a fighting
  def the_same_fighters?
    fighting_params.first[:fighter_id] == fighting_params.last[:fighter_id]
  end

  # When having more than two fighters in a fighting
  def too_many_fighters?
    fighting_params.size > 2
  end

  def normalized_fighting_params
    {
      fighter_one_id: fighting_params.first[:fighter_id],
      fighter_one_weapon_id: fighting_params.first[:weapon_id],
      fighter_two_id: fighting_params.last[:fighter_id],
      fighter_two_weapon_id: fighting_params.last[:weapon_id]
    }
  end
end
