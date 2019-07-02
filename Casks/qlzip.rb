cask 'qlzip' do
  version '1.5'
  sha256 "010de5f72158ae644896980b47176a5f4621a0630b592266d26c23bce22be24f"

  url 'https://macitbetter.com/dl/BetterZipQL-1.5.zip'
  name 'qlzip'
  homepage 'https://macitbetter.com/BetterZip-Quick-Look-Generator/'

  qlplugin 'BetterZipQL.qlgenerator'
end
