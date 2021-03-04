class Bond < ApplicationRecord
    STATES = [
        FOLLOWING = 'following',
        REQUESTING = 'requesting'
    ].freeze
    
    scope :following, -> { where(state: FOLLOWING) }
    scope :requesting, -> { where(state: REQUESTING) }

    validates :state, inclusion: { in: STATES }
    belongs_to :user
    belongs_to :friend, class_name: 'User'
end
