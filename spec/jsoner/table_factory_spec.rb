require "#{File.dirname(__FILE__)}/../fixtures/table"
require "#{File.dirname(__FILE__)}/../../lib/jsoner"

describe 'build Hash below from doc parsed by Nokogiki' do

  before :each do
    @obj = Nokogiri::HTML.parse(table_str)
    @factory = Jsoner::TableFactory.new(@obj)
  end

  it "@table_rows should be instance of NodeSet" do
    @factory.instance_variable_get(:@table_rows).should be_instance_of Nokogiri::XML::NodeSet
  end

  context "Building header" do
    it "should return Array" do
      @factory.build_header.should be_instance_of Array
    end

    it "should match data from fixtures" do
      @factory.build_header.should == ["First Name", "Last Name", "Points"] 
    end
  end

  context "Building body" do
    it "should return Double Dimensional Array" do
      @factory.build_body.should be_instance_of Array
      @factory.build_body.each{ |column| column.should be_instance_of Array }
    end
  end

  context "Building full hash defined table" do
     it "should have _header_ key" do
       @factory.create.should have_key :header
     end

     it "should have _body_ key" do
       @factory.create.should have_key :header
     end

     it "data mapped by _header_ key should match fixtures" do
       @factory.create[:header].should == ["First Name", "Last Name", "Points"]
     end

     it "data mapped by _body_ key should match fixtures" do
       @factory.create[:body].should == [["Jill", "Smith", "50"],
                                         ["Eve", "Jackson", "94"],
					 ["John", "Doe", "80"],
					 ["Adam", "Johnson", "67"]]
     end

     # TODO testing when having no header in table
  end
end
