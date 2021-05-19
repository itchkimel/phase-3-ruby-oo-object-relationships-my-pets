
class Owner
  attr_reader :name, :species
  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end
  
  def dogs 
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog (name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"} #shorthand for the code of feed_cats
  end
  
  def feed_cats
    self.cats.each do |cat| 
      cat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = self.dogs + self.cats
    all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end 
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end