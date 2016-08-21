class Candy

  attr_accessor :id, :name, :price, :expiry

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @price = hash["price"]
    @expiry = hash["expiry"]
  end
end