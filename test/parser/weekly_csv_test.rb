# frozen_string_literal: true

require 'test_helper'

describe 'Parser::WeeklyCsv' do
  describe '#each' do
    describe 'for valid input file' do
      subject { WdSchedule::Parser::WeeklyCsv.new('test/input/doctors.csv') }

      it 'should return parsed rows' do
        expected_result = [
          [
            WdSchedule::Doctor.new(name: 'Dr. Kim'),
            WdSchedule::Schedule::WeeklyRule.new(monday: true, wednesday: true, saturday: true, sunday: true)
          ],
          [
            WdSchedule::Doctor.new(name: 'Dr. Adamski'),
            WdSchedule::Schedule::WeeklyRule.new(tuesday: true, wednesday: true, thursday: true, saturday: true)
          ],
          [
            WdSchedule::Doctor.new(name: 'Dr. May'),
            WdSchedule::Schedule::WeeklyRule.new(monday: true, tuesday: true, saturday: true, sunday: true)
          ]
        ]

        parsed_result = []
        subject.each do |doctor, rule|
          parsed_result << [doctor, rule]
        end

        expect(parsed_result).must_equal expected_result
      end
    end

    describe 'for invalid input file' do
      subject { WdSchedule::Parser::WeeklyCsv.new('test/input/invalid_doctors.csv') }

      it 'should raise exception' do
        proc { subject.each {} }.must_raise WdSchedule::Parser::WeeklyCsv::ParserError
      end
    end
  end
end
