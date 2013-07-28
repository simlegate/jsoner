require "#{File.dirname(__FILE__)}/../fixtures/table"
require "#{File.dirname(__FILE__)}/../../lib/jsoner"

describe "parse structure of table" do

  before :each do
    @nokogiri_obj = Nokogiri::HTML.parse(table_str)
    @table = Jsoner::Table.new(@nokogiri_obj)
  end

  it "should return header of table" do
    @table.header.should == ["First Name", "Last Name", "Points"] 
  end

  it "should return all data of first column default" do
    @table.row.should ==  ["Jill", "Smith", "50"]
  end
end
