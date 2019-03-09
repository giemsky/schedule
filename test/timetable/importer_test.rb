# frozen_string_literal: true

describe 'TimeTable::Importer' do
  describe '#import' do
    let(:parser) do
      Class.new do
        def each
          yield WdSchedule::Doctor.new(name: 'Dr. Dolittle'), WdSchedule::Schedule::WeeklyRule.new(monday: true)
          yield WdSchedule::Doctor.new(name: 'Dr. Jekyll'), WdSchedule::Schedule::WeeklyRule.new(sunday: true)
        end
      end
    end
    subject { WdSchedule::Timetable::Importer.new }

    it 'should return timetable consisting imported items' do
      timetable = subject.import(parser.new)
      timetable.must_be_instance_of WdSchedule::Timetable
      timetable.size.must_be :==, 2
    end
  end
end
