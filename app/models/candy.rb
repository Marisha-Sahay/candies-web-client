class Candy

  attr_accessor :id, :name, :price, :expiry

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @price = hash["price"]
    @expiry = hash["expiry"]
  end

  def self.find(id)
    candy_hash = Unirest.get("#{ENV['DOMAIN']}/candies/#{id}.json").body
    return Candy.new(candy_hash)
  end

  def self.all()
    @candies = []
    @candies_hash = Unirest.get("#{ENV['DOMAIN']}/candies.json").body
    @candies_hash.each do |candy|
      @candies << Candy.new(candy)
    end
    return @candies
  end

  def self.destroy(id)
    Unirest.delete("#{ENV['DOMAIN']}/candies/#{id}.json").body
  end

end