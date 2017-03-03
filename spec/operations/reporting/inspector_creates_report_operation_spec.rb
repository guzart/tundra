require 'rails_helper'

describe Reporting::InspectorCreatesReportOperation do
  it 'creates a report successfully' do
    inspector = FactoryGirl.build(:reporting_inspector)
    # inspector_repository = FakeRepository.new(inspector)

    # container = {
    #   'persistence.repositories.inspector' => inspector_repository
    # }

    # params = { inspector_id: inspector.id }
    # Reporting::InspectorCreatesReportOperation.call(params, container)
  end
end
