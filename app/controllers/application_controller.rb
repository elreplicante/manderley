class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :set_locale
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_root

  private
  def set_locale
    if params[:locale].present?
      locale = params[:locale].downcase.to_sym      
        I18n.locale = I18n.available_locales.include?(locale) ? 
          locale : I18n.default_locale
    end
  end

  protected
  def redirect_to_root
    redirect_to root_path, notice: "Not allowed"
  end
end
