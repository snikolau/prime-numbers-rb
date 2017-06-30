require 'terminal-table'
module PrimerTask
  # Class prints table representation of 2d arrays.
  # It is possible to predefine output stream when class is initialised
  class TablePrinter
    def initialize(data, out = STDOUT)
      @out = out
      @table = Terminal::Table.new do |t|
        data.each_with_index do |row, i|
          t.add_row row
          t.add_separator if i == 0
        end
      end
    end

    def print
      @out.print @table
    end
  end
end
