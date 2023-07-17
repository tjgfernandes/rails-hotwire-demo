class TimeController < ApplicationController
  def index
    @timezones = ActiveSupport::TimeZone.all
    @time = Time.now
  end  

  def show
    @timezones = ActiveSupport::TimeZone.all
    @time = Time.now.in_time_zone(params[:id])
    render :index
  end

  def show_one
    @timezone = ActiveSupport::TimeZone.all.find {|tz| tz.name == params[:id]}
    @time = Time.now

    respond_to do |format|
      format.turbo_stream { render }
      format.html { render layout: false }
    end
  end
end
