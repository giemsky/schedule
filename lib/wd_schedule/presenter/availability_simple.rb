# frozen_string_literal: true

module WdSchedule
  module Presenter
    class AvailabilitySimple
      def initialize(output = $stdout)
        @output = output
      end

      def present(doctors)
        Array(doctors).each do |doctor|
          @output.puts "#{doctor.name} is available"
        end
      end
    end
  end
end
