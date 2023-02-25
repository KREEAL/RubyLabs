require_relative 'student'
require_relative 'student_base'
require_relative 'student_short'
require_relative 'data_table'


data_test = [[1, 'A', [true,true,true]], [0, 'B']]
data_table = DataTable.new(data_test)
puts data_table.get_item(0, 2)
puts data_table.rows_count
puts data_table.cols_count