# frozen_string_literal: true

require 'csv'

module WdSchedule
  module Parser
    class WeeklyCsv
      DOCTOR_HEAT_MAP = {
        'Doctor Name' => :name
      }.freeze

      WEEKDAYS_HEADER_MAP = {
        'Monday' => :monday,
        'Tuesday' => :tuesday,
        'Wednesday' => :wednesday,
        'Thursday' => :thursday,
        'Friday' => :friday,
        'Saturday' => :saturday,
        'Sunday' => :sunday
      }.freeze

      WEEKDAYS_STATES_MAP = { 'ON' => true, 'OFF' => false }.freeze

      ParserError = Class.new(StandardError)

      def initialize(filepath)
        @filepath = filepath
      end

      def each
        CSV.foreach(@filepath, headers: true) do |row|
          doctor, schedule_rule = parse_row(row)
          yield doctor, schedule_rule
        end
      rescue Dry::Struct::Error => e
        raise ParserError, e.message
      end

      private

      def parse_row(row)
        doctor_attributes = transform_keys(row, DOCTOR_HEAT_MAP)
        doctor = WdSchedule::Doctor.new(doctor_attributes)

        rule_attributes = transform_keys(row, WEEKDAYS_HEADER_MAP).transform_values { |v| WEEKDAYS_STATES_MAP[v] }
        rule = WdSchedule::Schedule::WeeklyRule.new(rule_attributes)

        [doctor, rule]
      end

      def transform_keys(row, map)
        row.to_hash.slice(*map.keys).transform_keys { |k| map[k] }
      end
    end
  end
end
