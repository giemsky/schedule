# frozen_string_literal: true

describe 'Schedule' do
  describe '#available_on_weekdays?' do
    describe 'without any rule' do
      subject { WdSchedule::Schedule.new }

      it 'should return false' do
        subject.available_on_weekdays?(:monday).must_equal false
      end
    end
  end
end
