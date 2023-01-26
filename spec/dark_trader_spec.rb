require_relative '../lib/dark_trader.rb/'

describe "perform" do
  it "create an array of hash with name and value of crypto" do
    expect(perform[0]).to eq("BTC"=>"$23,100.97")
    expect(perform[3]).to eq({"BNB"=>"$306.02"})
end
end