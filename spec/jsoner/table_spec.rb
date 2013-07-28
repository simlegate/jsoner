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

  context "should remove tr of th when search +tr+ with Nokogiri" do
    it "header exists" do
      @table.send(:shift_tr).search('th').map(&:content).should == ["First Name", "Last Name", "Points"]
    # why ?
    # @table.send(:shift_tr).children.map(&:content).should == ["First Name", "Last Name", "Points"]
    end

    it "header does not exists" do
      # TODO simulate no-header table
      # @table.send(:shift_tr).should be_nil
    end
  end
end
