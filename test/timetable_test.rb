# frozen_string_literal: true

require 'test_helper'

describe 'Timetable' do
  describe '#add_item' do
    let(:doctor) { WdSchedule::Doctor.new(name: 'Dr. Schweitzer') }
    let(:schedule) { WdSchedule::Schedule.new }
    let(:subject) { WdSchedule::Timetable.new }

    it 'should raise error for duplicated records' do
      subject.add_item(doctor, schedule)
      proc { subject.add_item(doctor, schedule) }.must_raise WdSchedule::Timetable::DuplicatedRecordError
    end

    it 'should add items to the list' do
      expected = { doctor => schedule }
      result = {}
      subject.add_item(doctor, schedule)
      subject.each { |doctor, schedule| result[doctor] = schedule }

      result.must_equal expected
    end
  end
end
