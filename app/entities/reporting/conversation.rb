module Reporting
  class Conversation < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :participants, Types::Strict::Array.member(Types::Participant)
    attribute :report, Report
  end
end
