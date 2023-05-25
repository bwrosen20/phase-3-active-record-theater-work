class Audition < ActiveRecord::Base
  belongs_to :role

    def call_back
        actor=self
        actor.hired=true
        actor.save
    end

end