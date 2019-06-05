class Api::V1::FightingSerializer < ActiveModel::Serializer
  attributes :winner_gained_experience, :winner_leveled_up, :winner, :loser

  def winner
    object.winner_character
  end

  def loser
    object.loser_character
  end
end
