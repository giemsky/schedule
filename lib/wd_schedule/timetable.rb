# frozen_string_literal: true

module WdSchedule
  class Timetable
    include Enumerable

    class DuplicatedRecordError < StandardError
      def initialize(doctor)
        super("Duplicated record in timetable: #{doctor.name}")
      end
    end

    def initialize
      @timetable = {}
    end

    def add_item(doctor, schedule)
      raise DuplicatedRecordError, doctor if @timetable.key?(doctor)

      @timetable[doctor] = schedule
    end

    def each
      @timetable.each { |doctor, schedule| yield doctor, schedule }
    end

    def size
      @timetable.size
    end
  end
end

require_relative 'timetable/importer'
require_relative 'timetable/searcher'
