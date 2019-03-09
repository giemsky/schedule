# frozen_string_literal: true

module WdSchedule
  class Timetable
    class Importer
      def import(parser)
        WdSchedule::Timetable.new.tap do |timetable|
          parser.each do |doctor, schedule_rule|
            schedule = WdSchedule::Schedule.new(schedule_rule)
            timetable.add_item(doctor, schedule)
          end
        end
      end
    end
  end
end
