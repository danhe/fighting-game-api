class Api::V1::CharactersController < Api::V1::BaseController
  before_action :load_resource

  # GET /api/v1/characters
  def index
    render json: @character, each_serializer: Api::V1::CharacterSerializer
  end

  # POST /api/v1/characters
  def create
    if @character.save
      render json: @character, serializer: Api::V1::CharacterSerializer, status: :ok
    else
      invalid_resource!(@character.errors.full_messages)
    end
  end

  # GET /api/v1/characters/:id
  def show
    render json: @character, serializer: Api::V1::CharacterSerializer
  end

  # UPDATE /api/v1/characters/:id
  def update
    if @character.update(update_params)
      render json: @character, serializer: Api::V1::CharacterSerializer
    else
      invalid_resource!(@character.errors.full_messages)
    end
  end

  # DELETE /api/v1/characters/:id
  def destroy
    @character.destroy!

    render json: @character, serializer: Api::V1::CharacterSerializer
  end

  private

  def load_resource
    case params[:action].to_sym
    when :index
      @character = Character.all
    when :create
      @character = Character.new(create_params)
    when :show, :update, :destroy
      @character = Character.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    # To investigate Rails issue https://github.com/rails/rails/issues/29124
    not_found!
  end

  def create_params
    params.permit(:name)
  end

  def update_params
    create_params
  end
end
