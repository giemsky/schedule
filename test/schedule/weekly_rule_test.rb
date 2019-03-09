# frozen_string_literal: true

describe 'Schedule::WeeklyRule' do
  it 'should raise exception when initialized with invalid values' do
    proc { WdSchedule::Schedule::WeeklyRule.new(monday: 1) }.must_raise Dry::Struct::Error
  end

  describe '#available_on?' do
    subject { WdSchedule::Schedule::WeeklyRule.new(monday: true, friday: true, sunday: true) }
    it 'should return true if all given days are available' do
      subject.available_on?(:monday, :friday).must_equal true
    end

    it 'should return false if any given day is unavailable' do
      subject.available_on?(:monday, :friday, :saturday).must_equal false
    end

    it 'should raise exception for invalid weekday name' do
      proc { subject.available_on?(:mmonday) }.must_raise WdSchedule::Schedule::WeeklyRule::InvalidDayError
    end
  end
end
