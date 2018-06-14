class Coinmarketcap < ActiveResource::Base

  self.site = "http://api.coinmarketcap.com/v1/ticker/"
end
