module Reporting
  class InspectorsController < BaseController
    def create_report
      Inspector::CreateReport.call(params)
      head :created
    end
  end
end
