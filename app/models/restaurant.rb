# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, exclusion: { in: %w[neptunian] }
end
