Dir["#{File.dirname(__FILE__)}/fixtures/*.rb"].each {|file| require file }
require "#{File.dirname(__FILE__)}/../../lib/jsoner"

describe "parse structure of table" do

  before :each do
    obj = Nokogiri::HTML.parse(table_str)
    factory = Jsoner::TableFactory.new(obj)
    @table = Jsoner::Table.new(factory)
  end
  
  context "the number of row beside header in table" do
    it "should == 4 " do
      @table.row_number.should == 4
    end
  end

  context "convert Hash from factory" do
    it "_convert_ should private method" do
      expect{ @table.convert }.to raise_error NoMethodError
    end

    it "should be instance of Array" do
      @table.send(:convert).should be_instance_of Array
    end

    it "everyone should be instance of Hash in Array" do
      @table.send(:convert).map{ |h| h.should be_instance_of Hash}
    end

    it "everyone should have keys including _First Name_,_Last Name_,_Score_ in Array" do
      @table.send(:convert).map{ |h| h.should have_key "First Name"}
      @table.send(:convert).map{ |h| h.should have_key "Last Name"}
      @table.send(:convert).map{ |h| h.should have_key "Points"}
    end

    it "match full data" do
      @table.send(:convert).should == pre_json
    end
  end
end
