# frozen_string_literal: true

require 'test_helper'

describe 'Presenter::AvailabilitySimple' do
  describe '#present' do
    let(:output) { StringIO.new }
    subject { WdSchedule::Presenter::AvailabilitySimple.new(output) }

    it 'should output all doctors from the list' do
      doctors = [
        WdSchedule::Doctor.new(name: 'Dr. Stranger'),
        WdSchedule::Doctor.new(name: 'Dr. Grey')
      ]
      expected_output = "Dr. Stranger is available\nDr. Grey is available\n"
      subject.present(doctors)
      output.string.must_equal expected_output
    end
  end
end
