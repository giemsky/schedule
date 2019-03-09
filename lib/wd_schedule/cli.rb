# frozen_string_literal: true

module WdSchedule
  class << self
    def cli
      require 'optparse'

      options = {}
      optparse = OptionParser.new do |opts|
        opts.banner = 'Usage: wd_schedule import_file [options]'

        opts.on('-dDAY', '--day=DAY', 'Filters doctor availability by day') do |d|
          options[:day] = String(d)
        end
      end
      optparse.parse!

      import_file = ARGV.shift
      unless import_file
        puts optparse
        exit(-1)
      end

      cli_process(import_file, options)
    end

    def cli_process(filepath, options)
      parser = WdSchedule::Parser::WeeklyCsv.new(filepath)
      importer = WdSchedule::Timetable::Importer.new
      timetable = importer.import(parser)
      searcher = WdSchedule::Timetable::Searcher.new(timetable)
      searcher.find_doctor(options[:day])
    end
  end
end
