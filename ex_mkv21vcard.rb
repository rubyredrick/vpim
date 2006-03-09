# Note that while most version 3.0 vCards should be valid 2.1 vCards, they
# aren't guaranteed to be. vCard 2.1 is reasonably well supported on decode,
# I'm not sure how well it works on encode.
#
# Most things should work, but you should test whether this works with your 2.1
# vCard decoder. Also, avoid base64 encoding, or do it manually.
require 'vpim/maker/vcard'

# Create a new 2.1 vCard.
card21 = Vpim::DirectoryInfo.create(
  [
    Vpim::DirectoryInfo::Field.create('VERSION', '2.1')
  ], 'VCARD')

Vpim::Maker::Vcard.make2(card21) do |maker|
  maker.add_name do |name|
    name.prefix = 'Dr.'
    name.given = 'Jimmy'
    name.family = 'Death'
  end

end

puts card21

# Copy and modify a 2.1 vCard, preserving it's version.
mod21 = Vpim::Maker::Vcard.make2(Vpim::DirectoryInfo.create([], 'VCARD')) do |maker|
  maker.copy card21
  maker.nickname = 'some name'
end

puts '---'
puts mod21
