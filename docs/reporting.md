# Domain

* `Reporting::Building`
* `Reporting::Inspector`
* `Reporting::Inspector::CreatesReportOperation`
* `Reporting::Report::CreatedEvent`
* `Reporting::InspectorRepository`

Entities:

* `Reporting::Entities::Building`
* `Reporting::Entities::Comment`
* `Reporting::Entities::Contact`
* `Reporting::Entities::Conversation`
* `Reporting::Entities::ConversationMessage`
* `Reporting::Entities::Inspector`
* `Reporting::Entities::Photo`
* `Reporting::Entities::Report`
* `Reporting::Entities::ReportRating`
* `Reporting::Entities::Supervisor`

Events:

* `Reporting::Events::CommentPosted`
* `Reporting::Events::ConversationCreated`
* `Reporting::Events::MessageSent`
* `Reporting::Events::ReportApproved`
* `Reporting::Events::ReportAutoApproved`
* `Reporting::Events::ReportRated`
* `Reporting::Events::ReportRejected`
* `Reporting::Events::ReportSubmitted`

## Application

Operations:

* `Reporting::Operations::Contact::RatesReport`
* `Reporting::Operations::Inspector::CreatesReport`
* `Reporting::Operations::Inspector::DiscardsReport`
* `Reporting::Operations::Inspector::SubmitsReport`
* `Reporting::Operations::Inspector::UpdatesReport`
* `Reporting::Operations::Report::SendsApprovalNotifications`
* `Reporting::Operations::Report::SendsAutoApprovedNotifications`
* `Reporting::Operations::Report::SendsContactsNotifications`
* `Reporting::Operations::Report::SendsRejectionNotifications`
* `Reporting::Operations::Report::SendsReportRatingNotifications`
* `Reporting::Operations::Supervisor::ApprovesReport`
* `Reporting::Operations::Supervisor::RejectsReport`

Services:

* `Reporting::Reports::SubmitService`

Repositories:

* `Reporting::Repositories::BuildingsRepository`
* `Reporting::Repositories::ContactsRepository`
* `Reporting::Repositories::InspectorsRepository`
* `Reporting::Repositories::ReportsRepository`
* `Reporting::Repositories::SupervisorsRepository`

Rails:

* `Inspector` – Persistence

## Operations

### Inspector creates a report

1. POST request for mutation with params :tenant_id, :inspector_id
1. InspectorRepository.find(inspector_id) – Load the inspector
1. InspectorPolicy.create_report? – Authorize that current_user can create reports for the given inspector
1. inspector.create_report() – Returns a new report with the contextual inspector as the author and part of the inspector list
1. ReportRepository.save(report) – Persist the new report
1. Return new report
1. Return report_id

### Inspector updates a report

1. POST request for mutation with params :tenant_id, :inspector_id, :report_id
1. Load the inspector – InspectorRepository.find(inspector_id)
1. Load the report – ReportRepository.find(report_id)
1. InspectorPolicy.update_report? – Authorize that the inspector can update the report
1. inspector.update_report(report, params) – Update allowed data and run validations
1. ReportRepository.save(report) – Persist the updated report
1. Return updated report


### Inspector submits a report

1. POST request for mutation with params :tenant_id, :inspector_id, :report_id
1. Load the inspector – InspectorRepository.find(inspector_id)
1. Load the report – ReportRepository.find(report_id)
1. InspectorPolicy.submit_report? – Authorize that the inspector can submit the report
1. inspector.submit_report(report) – Update status
1. EventBus.publish(ReportSubmittedEvent.new(inspector, report)) – Publishes that a report was submitted
1. Return updated report

### Report submitted handler

1. Listens for ReportSubmitted events
1. Check if the supervisor is trusted
1. If the supervisor is trusted approve the report and publis an ReportAutoApproved event
1. Otherwise, execute the SendApprovalNotification command

## TODO

* Express the difference between a report submitted by an supervisor, by a trusted inspector
  and by a regular inspector

```ruby
inspector.submit_report(report)
Reports::SubmitService.submit_by_inspector(self, report)
# or
supervisor.submit_report(report)
Reports::SubmitService.submit_by_supervisor(self, report)
```

## Infrastructure

GraphQL:

* `GraphQL::Reporting::Mutations::InspectorCreatesReport`
* `GraphQL::Reporting::Mutations::InspectorDiscardsReport`
* `GraphQL::Reporting::Mutations::InspectorSubmitsReport`
* `GraphQL::Reporting::Mutations::InspectorUpdatesReport`
* `GraphQL::Reporting::Mutations::SupervisorRejectsReport`
* `GraphQL::Reporting::Resolvers::Inspector`
* `GraphQL::Reporting::Types::Building`
* `GraphQL::Reporting::Types::Inspector`
* `GraphQL::Reporting::Types::Query`
* `GraphQL::Reporting::Types::Viewer`
* `GraphQL::Schema`
