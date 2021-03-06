class KarateDojo < ApplicationRecord
  include Searchable

  # we are assuming this fields as string fields
  validates :name, :city, :activity_code, :category, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :city, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :activity_code, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :category, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
    end
  end
end
