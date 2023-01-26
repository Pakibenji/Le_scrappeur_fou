require_relative '../lib/mairie_christmas'

describe "get_townhall_url" do
  it "should return of townhall" do
    expect(get_townhall_url[1]).to eq("Aincourt")
    expect(get_townhall_url[68]).to eq("Fremecourt")
end
end

describe "perform" do
  it "should return an array of hashes with name and mail of townhall " do
    expect(perform[1]).to eq({"Aincourt"=>"mairie.aincourt@wanadoo.fr"})
    expect(perform[68]).to eq({"Fremecourt"=>"mairiefremecourt@orange.fr"})
end
end

