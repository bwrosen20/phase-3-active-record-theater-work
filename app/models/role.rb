require "pry"

class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actor_array=self.auditions.map do |audition|
            audition.actor
        end
    actor_array
    end

    def locations
        location_array=self.auditions.map do |audition|
            audition.location
        end
    location_array
    end

    def lead
        lead_actor=self.auditions.find do |audition|
            audition.hired
        end
        lead_actor ? lead_actor : "no actor has been hired for this role"
    end

    def understudy
        i=0
        j=0
        understudy="no actor has been hired for this role"
        while i<2 && j<self.auditions.length
            if self.auditions[j].hired
                i+=1
                understudy=self.auditions[j].actor
            end
            j+=1
        end
        understudy
    end


end