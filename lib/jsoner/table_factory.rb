module Jsoner
  #
  # build Hash below from doc parsed by Nokogiki
  #   table = { :header => ["First Name", "Last Name", "Score"]
  #             :body   => [["Jill", "Smith", "50"],
  #                         ["Eve", "Jackson", "94"],
  #                         ["John", "Doe", "80"],
  #                         ["Adam", "Johnson", "67"]
  #                        ]
  #           }
  class TableFactory

    def initialize doc
      @table_rows = remove_housing(doc).search('tr')
    end

    def create
      { :header => build_header, :body => build_body }
    end

    def build_header
      @table_rows[0].search('th').map(&:content)
    end

    def build_body
      row_number = @table_rows.count - 1
      (1..row_number).map do |row|
        @table_rows[row].search('td').map(&:content)
      end
    end

    # 
    # check whether table is full
    # a full table should include +th+, +td+, +tr+ elements
    def self.check doc
      table = doc.search('table').first
      unless table.search('tr').empty? || table.search('td').empty? || table.search('th').empty?
        TableFactory.new doc
      else
	raise Jsoner::NotFullTable 
      end
    end

    private
      
      #
      # Remove other elements beside table and keep it clean
      # Or keep one table when including more than two table elements in parsed HTML
      #
      # Example: 
      # <body>
      #   <table>
      #     // other elements
      #   </table>
      #   <table>
      #     // other elements
      #   </table>
      # </body>
      #
      # Output:
      #   <table>
      #     // other elements
      #   </table>
      def remove_housing doc
	doc.search('table').first
      end
  end 
end
