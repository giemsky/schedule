# frozen_string_literal: true

module WdSchedule
  class Schedule
    def initialize(rule = nil)
      @rule = rule
    end

    def available_on_weekdays?(*weekdays)
      return false unless @rule
      @rule.available_on?(*weekdays.compact)
    end
  end
end

require_relative 'schedule/weekly_rule'
