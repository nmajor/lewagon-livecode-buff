class Group < ApplicationRecord
  belongs_to :division
  has_many :groupships, dependent: :destroy
  has_many :students, through: :groupships
  has_many :awards, dependent: :destroy
  has_many :merits, through: :awards
  belongs_to :captain, class_name: "Student", foreign_key: :captain_id, required: false
  serialize :recent_captain_ids, Array

  default_scope { order(score: :desc) }

  def update_score!
    self.score = awards.inject(0){|sum, award| sum + award.merit.points }
    self.save
  end

  def randomize_captain
    self.recent_captain_ids << captain.id
    self.recent_captain_ids = [] if self.recent_captain_ids.size == students.count

    if self.recent_captain_ids.size > 0
      offset = rand(students.count - self.recent_captain_ids.size)
      self.captain = students.where.not(id: self.recent_captain_ids).offset(offset).first
    else
      offset = rand(students.count)
      self.captain = students.offset(offset).first
    end
  end

  def randomize_captain!
    self.randomize_captain
    self.save
  end

  def self.random_name
    adjectives = %w(pretty bad good ugly amazing dark expert patron don alcoholic angry arrogant at-the-ready bat-shit-crazy blathering bull headed confused cruel-hearted demanding drunken fiercely-loyal flickering flirting free-loading frisky greedy hateful house-broken hyperactive high-end idiotic infuriating insecure maniacal mentally impaired misunderstood naked narrow-minded out-of-control outnumbered pea-brained rebellious self-absorbed shaky shivering sickened slippery stubborn territorial tripping twisted underhanded useless vengeful vile yapping zippy zombie adulterous)

    names = [Faker::LordOfTheRings.character, Faker::StarWars.character, Faker::StarWars.droid, Faker::Team.creature, Faker::HarryPotter.character]

    adjectives.sample.to_s.capitalize + " " + names.sample.to_s.capitalize
  end
end
