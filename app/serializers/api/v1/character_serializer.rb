class Api::V1::CharacterSerializer < Api::V1::BaseSerializer
  attributes(*Character.attribute_names.map(&:to_sym))
end
