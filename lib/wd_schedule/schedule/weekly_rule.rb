# frozen_string_literal: true

module WdSchedule
  class Schedule
    class WeeklyRule < Dry::Struct
      rule_type = Types::Strict::Bool.default(false)

      attribute :monday, rule_type
      attribute :tuesday, rule_type
      attribute :wednesday, rule_type
      attribute :thursday, rule_type
      attribute :friday, rule_type
      attribute :saturday, rule_type
      attribute :sunday, rule_type

      InvalidDayError = Class.new(StandardError)

      def ==(other)
        attributes == other.attributes
      end

      def available_on?(*weekdays)
        weekdays = Array(weekdays).map(&:downcase).map(&:to_sym)
        attributes.fetch_values(*weekdays).all?
      rescue KeyError => e
        raise InvalidDayError, e.key
      end
    end
  end
end
