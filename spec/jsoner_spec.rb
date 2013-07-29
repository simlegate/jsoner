Dir["#{File.dirname(__FILE__)}/fixtures/*.rb"].each {|file| require file }
require "#{File.dirname(__FILE__)}/../lib/jsoner"

describe Jsoner do
  
  it "should match data from json of fixtures" do
    Jsoner.parse(table_str).should == json
  end
end
