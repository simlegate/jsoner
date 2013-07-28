module Jsoner
  class Table

    attr_reader :table

    def initialize doc
      @table = doc
    end

    def row line=0
      shift_tr && trs[line].search('td').map(&:content)
    end

    def header
      table.search('th').map(&:content)
    end

    private

      # return all +tr+ elements of table
      def trs
        @table_rows ||= table.search('tr')
      end

      # remove first _tr_ included _th_
      def shift_tr
        trs.shift unless header.empty?
      end
  end
end
