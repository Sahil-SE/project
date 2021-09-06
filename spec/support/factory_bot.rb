RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods

    # validates_inclusion_of :status, in: [ 'pending', 'ongoing', 'completed', 'assessed' ], message: 'enter valid status'
  end