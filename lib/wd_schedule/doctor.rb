# frozen_string_literal: true

module WdSchedule
  class Doctor < Dry::Struct
    attribute :name, Types::Strict::String

    def hash
      name.hash
    end
  end
end
