require 'json'

module Jsoner
  class Table

    def initialize factory
      @table = factory.create
    end

    def row_number
      @table[:body].count
    end

    def to_json
      convert.to_json
    end

    #
    # convert Hash from factory into anthor Hash will be serialized into JSON
    # 
    # Example:
    #   table = { :header => ["First Name", "Last Name", "Points"]
    #             :body   => [["Jill", "Smith", "50"],
    #                         ["Eve", "Jackson", "94"],
    #                         ["John", "Doe", "80"],
    #                         ["Adam", "Johnson", "67"]] }
    #
    # Output:
    # table == [{"First Name"=>"Jill", "Last Name"=>"Smith",   "Points"=>"50"},
    #           {"First Name"=>"Eve",  "Last Name"=>"Jackson", "Points"=>"94"},
    #           {"First Name"=>"John", "Last Name"=>"Doe",     "Points"=>"80"},
    #           {"First Name"=>"Adam", "Last Name"=>"Johnson", "Points"=>"67"}]
    def convert
      (0...row_number).map do |index|

	#
	# Combine two Arrays into Hash
	#  a = ["a", "b", "c"]
	#  b = ["d", "e", "f"]
	#  Hash[a.zip(b)]
	#  => {"a" => "d", "b" => "e", "b" => "f" }
        Hash[@table[:header].zip(@table[:body][index])]
      end
    end

    private :convert
  end
end
