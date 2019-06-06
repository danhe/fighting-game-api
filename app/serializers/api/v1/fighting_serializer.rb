class Api::V1::FightingSerializer < ActiveModel::Serializer
  attributes(*Fighting.attribute_names.map(&:to_sym))
  attributes :winner, :loser

  def winner
    object.winner_character
  end

  def loser
    object.loser_character
  end
end
