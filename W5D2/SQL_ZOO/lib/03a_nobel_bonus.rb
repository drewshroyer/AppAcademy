# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# 1966 - Chemistry Person_1 
# 1966 - Literature Person_1 
# 1966 - Physics Person_1 
# where yr not in (1966,...) AND subject = 'Physics'
def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT DISTINCT
    yr
  FROM 
    nobels
  WHERE
    yr NOT IN
    ( SELECT 
        yr
      FROM
        nobels 
      WHERE
        subject = 'Chemistry' 
    ) AND subject = 'Physics' 
  SQL
end
