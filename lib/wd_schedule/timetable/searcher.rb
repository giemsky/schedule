# frozen_string_literal: true

module WdSchedule
  class Timetable
    class Searcher
      def initialize(timetable)
        @timetable = timetable
      end

      def find_doctor(weekday, presenter = Presenter::AvailabilitySimple.new)
        doctors = @timetable.select { |_doctor, schedule| schedule.available_on_weekdays?(weekday) }
                            .map { |doctor, _schedule| doctor }
        presenter.present(doctors)
      end
    end
  end
end
