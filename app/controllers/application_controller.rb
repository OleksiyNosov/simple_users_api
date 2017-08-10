class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  helper_method :collection, :resource

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = exception

    render :exception
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  def show
    resource
  end

  def create
    build_resource

    resource.save!
  end

  def update
    resource.update! resource_params    
  end

  def destroy
    resource.destroy!
  end
end
