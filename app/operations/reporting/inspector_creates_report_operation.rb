module Reporting
  class InspectorCreatesReportOperation < BaseOperation
    # validate input
    step :find_inspector
    step :authorize
    step Model(Report, :new)
    step :assign_inspector

    def find_inspector(options, params:, **)
      options['inspector'] = InspectorRepository.find(params[:inspector_id])
    end

    def authorize(options, **)
      # can this user tell this inspector to create a report?
      InspectorPolicy.new(options['current_user'], options['inspector']).create_report?
    end

    def assign_inspector
      options['model'].inspector = options['inspector']
    end
  end
end
