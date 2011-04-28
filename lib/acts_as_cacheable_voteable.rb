module ThumbsUp
  module ActsAsCacheableVoteable #:nodoc:

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_cacheable_voteable
        acts_as_voteable
        scope :votesort, :order => "votes_for_count - votes_against_count DESC"
        include ThumbsUp::ActsAsCacheableVoteable::InstanceMethods
        extend  ThumbsUp::ActsAsCacheableVoteable::SingletonMethods
      end
    end

    module SingletonMethods
    end

    module InstanceMethods

      def votes_for
        votes_for_count
      end

      def votes_against
        votes_against_count
      end

      # You'll probably want to use this method to display how 'good' a particular voteable
      # is, and/or sort based on it.
      def plusminus
        votes_for - votes_against
      end

      def votes_count
        votes_for_count + votes_against_count
      end
      
      def is_cacheable?
        true
      end

    end
  end
end
