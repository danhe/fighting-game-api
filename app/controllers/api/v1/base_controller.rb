class Api::V1::BaseController < ActionController::API
  rescue_from ActionController::ParameterMissing do
    missing_params!
  end

  rescue_from ActiveRecord::RecordNotFound do
    not_found!
  end

  rescue_from ActiveRecord::RecordInvalid do
    invalid_resource!
  end

  rescue_from ActionController::RoutingError do |e|
    routing_error!(e)
  end

  rescue_from Exception do |e|
    rescue_exception!(e)
  end

  # When no defined route, redirect here
  def undefined_route
    routing_error!
  end

  # =====================
  #  protected methods here
  # =====================
  protected

  # Missing parameters exception
  def missing_params!
    api_error(status: 400, errors: 'Invalid parameters')
  end

  #  Not Found exception
  def not_found!
    api_error(status: :not_found, errors: 'Not found')
  end

  # Invalid record exception
  def invalid_resource!(errors = [])!
    api_error(status: :unprocessable_entity, errors: errors)
  end

  # Routing error exception
  def routing_error!(exception = nil)
    api_error(status: :not_found, errors: 'Invalid/Undefined API')
  end

  # General exception
  def rescue_exception!(exception)
    api_error(status: :error, errors: exception.message)
  end

  def api_error(status: 500, errors: [])
    puts errors.full_messages if errors.respond_to?(:full_messages)

    render json: Api::V1::ErrorSerializer.new(status, errors).as_json, status: status
  end
end
