require 'acts_as_voteable'
require 'acts_as_voter'
require 'acts_as_cacheable_voteable'
require 'acts_as_cacheable_vote'
require 'has_karma'

ActiveRecord::Base.send(:include, ThumbsUp::ActsAsVoteable)
ActiveRecord::Base.send(:include, ThumbsUp::ActsAsCacheableVote)
ActiveRecord::Base.send(:include, ThumbsUp::ActsAsCacheableVoteable)
ActiveRecord::Base.send(:include, ThumbsUp::ActsAsVoter)
ActiveRecord::Base.send(:include, ThumbsUp::Karma)