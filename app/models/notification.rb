class Notification < ActiveRecord::Base
  self.table_name = :notification
  self.primary_key = :notification_id
end
