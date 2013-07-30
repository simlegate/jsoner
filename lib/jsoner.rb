require "jsoner/version"
require "jsoner/table"
require "jsoner/table_factory"

require 'nokogiri'

module Jsoner

  class NotFullTable < StandardError
    def message
      'Incomplete HTML Table'
    end
  end

  class << self

    def parse(html)
      html = filter(html)
      if factory = TableFactory.check(Nokogiri::HTML.parse(html))
        Table.new(factory).to_json
      end
    end
   
    def filter html
      if File.file? html
        File.open(html) { |file| file.read } 
      else
	html
      end
    end
    
  end
end
