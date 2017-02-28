# Reporting Context

* An inspector creates a report in an editable “draft” state
* The report includes the inspected building, date, start time and finish time
* The inspector can update the report with notes, photos and/or notes that are visible only to the agency.
* The inspector submits a report for approval, which changes the report status from the editable “draft” to the non-editable “pending approval”.
* When an inspector submits a report the supervisor receives an approval email.
  * If the inspector is deemed trusted the report is automatically approved and the supervisor receives a report copy.
* The supervisor can approve, edit, or reject a report.
  * When the report is approved (manually or automatically) a report notification is sent to the selected contacts to receive reports.
  * If report is rejected the supervisor must include the reason for rejection and the inspector receives a rejection notification to update and re-submit the report.
  * When the report is rejected the status changes to the editable "rejected"
* The contacts can rate the report as “positive” or “negative”.
* When a contact rates a report the supervisor receives a rating notification with the positive or negative rating
* All involved parties can post a comment on a report or send a private message about the report
  * When sending a private message the author can select the conversation participants

# Identity Context

* A user can create a session from any device using their login and password
* A user login is any unique value that identifies them e.g. email, phone, username
* When a user creates a new session they receive an access code, which they can use to identify themselves with the server
* The access code remains active for 4 weeks
* A user can deactivate any access code at any time
