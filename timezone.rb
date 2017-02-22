require 'active_support'      # Installed activesupport gem
require 'active_support/all'  # Was getting errors, Chris M. told me that this was required too. Read the doc on rubyonrails.org.

class TimeZone

  def response(chosen_zone)
    Time.zone = 'Eastern Time (US & Canada)'
    current_time = Time.zone.now
    adjusted_time = current_time.in_time_zone(chosen_zone)
    ['200', {'Content-Type' => 'text/html'}, ["The time in the #{chosen_zone} time zone is currently #{adjusted_time.strftime('%H:%M')}"]]
  end

  def self.call(zone)
    new.response(zone)
  end

end
