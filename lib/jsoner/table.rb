module Jsoner
  class Table

    attr_reader :table

    def initialize doc
      @table = doc
    end

    def row line=0
      # remove tr of th 
      trs.shift unless header.empty?
      trs[line].search('td').map(&:content)
    end

    def header
      table.search('th').map(&:content)
    end

    private

      # return all +tr+ elements of table
      def trs
        @table_rows ||= table.search('tr')
      end
  end
end
