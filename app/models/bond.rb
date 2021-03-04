class Bond < ApplicationRecord
    STATES = [
        FOLLOWING = 'following',
        REQUESTING = 'requesting'
    ].freeze

    validates :state, inclusion: { in: STATES }
    belongs_to :user
    belongs_to :friend, class_name: 'User'
end
