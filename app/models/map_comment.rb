class MapComment < ApplicationRecord
  belongs_to :user
  belongs_to :map
end
