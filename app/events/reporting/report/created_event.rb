module Reporting
  class Report
    class CreatedEvent < BaseEvent
      exchange 'reporting'
      routing_key 'report.event.created'
    end
  end
end
