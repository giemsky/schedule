# frozen_string_literal: true

require 'wd_schedule/version'
require 'dry-struct'

module WdSchedule
  module Types
    include Dry::Types.module
  end
end

require_relative 'wd_schedule/timetable'
require_relative 'wd_schedule/doctor'
require_relative 'wd_schedule/schedule'
require_relative 'wd_schedule/parser'
require_relative 'wd_schedule/cli'
require_relative 'wd_schedule/presenter'
