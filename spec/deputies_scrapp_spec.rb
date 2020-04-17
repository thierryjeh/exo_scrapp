require_relative '../lib/deputies_scrapp'


describe "email_scrapp" do
  it "email_scrapp (deputies)" do
    expect(email_scrapp("Damien Abad")).to eq("damien.abad@assemblee-nationale.frcontact@damien-abad.fr")
  end

 it "email_scrapp (deputies)" do
    expect(email_scrapp("Caroline Abadie")).to eq("caroline.abadie@assemblee-nationale.fr")
  end
end

