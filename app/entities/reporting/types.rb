module Reporting
  module Types
    include Dry::Types.module

    Participant = Contact | Inspector | Supervisor
    ReportStatus = Types::Strict::String.default('draft').enum('draft', 'submitted', 'rejected', 'approved')
  end
end
