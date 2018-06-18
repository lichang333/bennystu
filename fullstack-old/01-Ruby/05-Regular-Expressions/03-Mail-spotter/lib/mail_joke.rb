def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided

  # it "should raise an ArgumentError if input is not an email" do
  # expect( lambda { mail_joke("foo") } ).to raise_error ArgumentError


  # it "should compliment LeWagon email owners" do
  #   expect(mail_joke "boris@lewagon.org").to eq "Well done boris, you're skilled and capable"
  if /@lewagon.org$/ =~ email
    "Well done #{email[0, email.index(/@/)].gsub(/\./, ' ')}, you're skilled and capable"
  # it "should tell Gmail user that they are average and modern" do
  #   expect(mail_joke "boris@gmail.com").to eq "boris, you're an average but modern person"
  elsif /@gmail.com$/ =~ email
    "#{email[0, email.index(/@/)].gsub(/\./, ' ')}, you're an average but modern person"
  elsif /@live.com$/ =~ email
    "#{email[0, email.index(/@/)].gsub(/\./, ' ')}, aren't you born after 1973?"
  elsif /@.*\..+/ =~ email
    "Sorry #{email[0, email.index(/@/)].gsub(/\./, ' ')}, we don't know how to judge 'milkyway.gal'"
  else
    raise ArgumentError.new("message")
  end
end

