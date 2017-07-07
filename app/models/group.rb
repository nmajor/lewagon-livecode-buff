
# require 'faker'
class Group < ApplicationRecord
  belongs_to :division
  has_many :groupships, dependent: :destroy
  has_many :students, through: :groupships

  def self.random_name
    adjectives = %w(pretty bad good ugly amazing dark expert patron don alcoholic angry arrogant at-the-ready bat-shit-crazy blathering bull headed confused cruel-hearted demanding drunken fiercely-loyal flickering flirting free-loading frisky greedy hateful house-broken hyperactive high-end idiotic infuriating insecure maniacal mentally impaired misunderstood naked narrow-minded out-of-control outnumbered pea-brained rebellious self-absorbed shaky shivering sickened slippery stubborn territorial tripping twisted underhanded useless vengeful vile yapping zippy zombie adulterous)

    names = [Faker::LordOfTheRings.character, Faker::StarWars.character, Faker::StarWars.droid, Faker::Team.creature, Faker::HarryPotter.character]

    adjectives.sample.to_s.capitalize + " " + names.sample.to_s.capitalize
  end
end
