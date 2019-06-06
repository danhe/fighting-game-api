class Fighting < ApplicationRecord
  EXPERIENCE_LEVELLED_UP = 2
  LIFE_LEVELLED_UP = 1.2

  belongs_to :fighter_one, class_name: :Character
  belongs_to :fighter_two, class_name: :Character

  # It can be empty, when not use weapons
  belongs_to :fighter_one_weapon, class_name: :Weapon, optional: true
  belongs_to :fighter_two_weapon, class_name: :Weapon, optional: true

  def start
    # Fight firstly
    fighter_one.fight(fighter_two, weapons: weapons)

    # Set winner of this fighting
    set_winner

    # Game over, restore the current life of fighters
    game_over
  end

  def winner_character
    fighter_one_wins? ? fighter_one : fighter_two
  end

  def loser_character
    fighter_one_wins? ? fighter_two : fighter_one
  end

  # All weapons
  def weapons
    {
      fighter_one_weapon: fighter_one_weapon,
      fighter_two_weapon: fighter_two_weapon
    }
  end

  private

  def set_winner
    if fighter_one.current_life > fighter_two.current_life
      winner = fighter_one
      loser = fighter_two
      winner_sym = Character::FIGHTER_ONE
    else
      winner = fighter_two
      loser = fighter_one
      winner_sym = Character::FIGHTER_TWO
    end
    self.winner = winner_sym
    gained_exp = gained_exp(winner: winner, loser: loser)
    self.winner_gained_experience = gained_exp
    self.winner_leveled_up = winner.win_a_fighting(gained_exp)

    save!
  end

  def game_over
    fighter_one.current_life = fighter_one.max_life
    fighter_two.current_life = fighter_two.max_life
    fighter_one.save! && fighter_two.save!
  end

  def gained_exp(winner:, loser:)
    (((winner.max_life - winner.current_life) * 0.85) * loser.level).round
  end

  def fighter_one_wins?
    winner == Character::FIGHTER_ONE
  end
end
