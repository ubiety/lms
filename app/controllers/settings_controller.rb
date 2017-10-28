# Settings controller
class SettingsController < ApplicationController
  before_action :find_setting, only: %w[edit update]

  def index
    @settings = Setting.get_all
  end

  def update
    value = params['setting']['value']
    if @setting.value != value
      @setting.value = value
      @setting.save
      redirect_to settings_path, notice: _('Setting has updated')
    else
      redirect_to settings_path
    end
  end

  private

  def find_setting
    id = params[:id]
    @setting = Setting.find_by(var: id) || Setting.new(var: id)
  end
end
