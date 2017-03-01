module Reporting
  class Report < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :building, Building
    attribute :notes_for_office, Types::Strict::String
    attribute :notes, Types::Strict::String
    attribute :status, Types::ReportStatus
  end
end
