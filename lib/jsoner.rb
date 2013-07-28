require "jsoner/version"
require "jsoner/table"

require 'nokogiri'

module Jsoner
  class << self

    def parse(html)
      doc = Nokogiri::HTML.parse(table_str)
      @table = Jsoner::Table.new(doc)
    end
  end
end
