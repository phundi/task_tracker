class Status < ActiveRecord::Base
  self.table_name = :status
  self.primary_key = :status_id
end
