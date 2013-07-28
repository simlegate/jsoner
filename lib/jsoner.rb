require "jsoner/version"
require 'nokogiri'

module Jsoner
  class << self

    def parse(html)
      doc = Nokogiri::HTML(html)
      doc.search('table').each do |table|
      end
    end
  end
end
