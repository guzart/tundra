require 'rails_helper'

describe Reporting::InspectorCreatesReportOperation do
  it 'creates a report successfully' do
    inspector = FactoryGirl.build(:inspector)
    Reporting::InspectorCreatesReportOperation.({ inspector: inspector })
  end
end
