require "jsoner/version"
require "jsoner/table"
require "jsoner/table_factory"

require 'nokogiri'

module Jsoner
  class << self

    def parse(html)
      Jsoner::Table.new(Jsoner::TableFactory.new(Nokogiri::HTML.parse(html))).to_json
    end
  end
end
