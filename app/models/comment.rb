class Comment < ActiveRecord::Base
  self.table_name = :comment
  self.primary_key = :comment_id
end
