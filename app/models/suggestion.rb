class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :suggestionable, polymorphic: true
end
