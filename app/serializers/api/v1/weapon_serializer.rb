class Api::V1::WeaponSerializer < ActiveModel::Serializer
  attributes(*Weapon.attribute_names.map(&:to_sym))
end
