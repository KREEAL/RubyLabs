# frozen_string_literal: true

class DataTable

  def initialize(table)
    self.rows_count = table.length
    max_cols = 0
    table.each do |row|
      max_cols = row.length if row.size > max_cols
    end
    self.cols_count = max_cols
    self.table = table
  end

  def get_item(row, col)
    return nil if row >= rows_count || row <0
    return nil if col >= cols_count || col <0

    table[row][col]
  end

  public
  attr_reader :rows_count, :cols_count

  private
  attr_accessor :table
  attr_writer :rows_count, :cols_count

end
