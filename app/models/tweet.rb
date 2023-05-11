class Tweet < ApplicationRecord
  validates :topic, presence: true
end
