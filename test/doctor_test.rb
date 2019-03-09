# frozen_string_literal: true

require 'test_helper'

describe 'Doctor' do
  it 'should raise exception when initialized without name' do
    proc { WdSchedule::Doctor.new }.must_raise Dry::Struct::Error
  end

  it 'should raise exception when initialized with invalid name' do
    proc { WdSchedule::Doctor.new(name: 123) }.must_raise Dry::Struct::Error
  end

  describe '#hash' do
    let(:doctor_name) { 'Dr. Quinn' }
    let(:subject) { WdSchedule::Doctor.new(name: doctor_name) }

    it 'should be calculated based on name property' do
      subject.hash.must_equal doctor_name.hash
    end
  end
end
