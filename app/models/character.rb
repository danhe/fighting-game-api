class Character < ApplicationRecord
  FIGHTER_ONE = 'FIGHTER_ONE'.freeze
  FIGHTER_TWO = 'FIGHTER_TWO'.freeze

  validates :name, presence: true, uniqueness: true

  # All figtings linked to this character
  def fightings
    Fighting.where(fighter_one_id: id).or(Fighting.where(fighter_two_id: id))
  end

  # Fight with another fighter_two
  def fight(fighter_two)
    attack_arr = attack_array(fighter_two.level)
    # Fight until one character dies
    while current_life.positive? && fighter_two.current_life.positive?
      case attack_arr.sample
      when FIGHTER_TWO
        self.current_life -= fighter_two.power
      when FIGHTER_ONE
        fighter_two.current_life -= power
      end
    end
    save! && fighter_two.save!
  end

  # Reward experience to fighter_one.
  # Increase experience and level if enough experience is gained
  # if level increases, increase max life by 20%, restore current health
  # @return {Boolean} if the winner has leveled up
  def win_a_fighting(gained_exp = 0)
    winner_leveled_up = false

    self.current_experience += gained_exp
    while self.current_experience > max_experience
      self.level += 1
      self.current_experience -= max_experience
      self.max_experience *= Fighting::EXPERIENCE_LEVELLED_UP
      self.max_life = (max_life * Fighting::LIFE_LEVELLED_UP).round

      winner_leveled_up = true
    end
    save!

    winner_leveled_up
  end

  private

  # Algorithme to fight
  # Attack array list according the fighters' level
  def attack_array(fighter_two_level)
    attack_arr = []

    # Possibility to win when more levels
    self.level.times do
      attack_arr << FIGHTER_ONE
    end
    fighter_two_level.times do
      attack_arr << FIGHTER_TWO
    end

    attack_arr
  end
end
