class ApplicationController < ActionController::Base

  # def self.render_with_signed_in_user(user, message)
  #   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
  #   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap { |i| i.set_user(user, scope: :user) }
  #   renderer = self.renderer.new('warden' => proxy)
  #   renderer.render(message)
  # end

  attr_accessor :ith

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ihj

  protected

  def ihj
    @ijk = current_user.id if user_signed_in?
    @itm = current_user.username if user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email username])
  end
end
