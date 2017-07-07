
# require 'faker'
class Group < ApplicationRecord
  belongs_to :division
  has_many :groupships, dependent: :destroy
  has_many :students, through: :groupships

  def self.random_name
    adjectives = %w(pretty bad good ugly amazing dark expert patron don )
    names = [Faker::LordOfTheRings.character, Faker::StarWars.character, Faker::StarWars.droid, Faker::Team.creature, Faker::HarryPotter.character]

    adjectives.sample.to_s.capitalize + " " + names.sample.to_s.capitalize
  end
end
