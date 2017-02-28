# Domain

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

* `Reporting::Events::ReportApproved`
* `Reporting::Events::ReportAutoApproved`
* `Reporting::Events::ReportCommentPosted`
* `Reporting::Events::ReportMessageSent`
* `Reporting::Events::ReportRated`
* `Reporting::Events::ReportRejected`
* `Reporting::Events::ReportSubmitted`

## Application

Operations:

* `Reporting::Contacts::RateReport`
* `Reporting::Inspectors::CreateReport`
* `Reporting::Inspectors::DiscardReport`
* `Reporting::Inspectors::SubmitReport`
* `Reporting::Inspectors::UpdateReport`
* `Reporting::Reports::SendApprovalNotifications`
* `Reporting::Reports::SendAutoApprovedNotifications`
* `Reporting::Reports::SendContactsNotifications`
* `Reporting::Reports::SendRejectionNotifications`
* `Reporting::Reports::SendReportRatingNotifications`
* `Reporting::Supervisors::ApproveReport`
* `Reporting::Supervisors::RejectReport`

Services:

* `Reporting::Reports::DeliveryServices`

Repositories:

* `Reporting::Repositories::BuildingsRepository`
* `Reporting::Repositories::ContactsRepository`
* `Reporting::Repositories::InspectorsRepository`
* `Reporting::Repositories::ReportsRepository`
* `Reporting::Repositories::SupervisorsRepository`

## Infrastructure

GraphQL:

* `Reporting::GraphQL::Mutations::InspectorCreatesReport`
* `Reporting::GraphQL::Mutations::InspectorDiscardsReport`
* `Reporting::GraphQL::Mutations::InspectorSubmitsReport`
* `Reporting::GraphQL::Mutations::InspectorUpdatesReport`
* `Reporting::GraphQL::Mutations::SupervisorRejectsReport`
* `Reporting::GraphQL::Resolvers::Inspector`
* `Reporting::GraphQL::Schema`
* `Reporting::GraphQL::Types::Building`
* `Reporting::GraphQL::Types::Inspector`
* `Reporting::GraphQL::Types::Query`
* `Reporting::GraphQL::Types::Viewer`

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
ReportDeliveryService.new(inspector).submit_report(report)
ReportDeliveryService.inspector_submits_report(inspector, report)
# or
supervisor.submit_report(report)
```
