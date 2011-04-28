module ThumbsUp
  module ActsAsCacheableVote #:nodoc:

    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_cacheable_vote
        after_create  :add_vote_to_cache
        before_destroy :remove_vote_from_cache

        include ThumbsUp::ActsAsCacheableVote::InstanceMethods
      end
    end
    
    module InstanceMethods
      def add_vote_to_cache
        voteable.lock!
          if vote
            voteable.votes_for_count += 1
          else
            voteable.votes_against_count += 1
          end
        voteable.save!
      end
      
      def remove_vote_from_cache(on_delete = false)
        voteable.lock!
          if vote
            voteable.votes_for_count -= 1
          else
            voteable.votes_against_count -= 1
          end
        voteable.save!
      end
    end
  end
end
    