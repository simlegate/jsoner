require "#{File.dirname(__FILE__)}/fixtures/table"
require "#{File.dirname(__FILE__)}/../lib/jsoner"

describe Jsoner do
  
  it "should use nokogiri" do
    Jsoner.parse(table_str)
  end
end
