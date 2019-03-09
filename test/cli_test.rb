# frozen_string_literal: true

require 'test_helper'

describe 'WdSchedule' do
  describe '#cli_process' do
    let(:filepath) { 'test/input/doctors.csv' }
    let(:options) { { day: 'Monday' } }

    it 'should output available doctors' do
      expected_output = "Dr. Kim is available\nDr. May is available\n"
      out, = capture_io do
        WdSchedule.cli_process(filepath, options)
      end

      out.must_equal expected_output
    end
  end
end
