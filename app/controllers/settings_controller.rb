# Settings controller
class SettingsController < ApplicationController
  def index
    @settings = Setting.get_all
  end
end
