module Spree
  module V2
    module Storefront
      class FeedbackReviewSerializer < BaseSerializer
        set_type   :feedback_review

        attributes :rating, :comment, :created_at

        belongs_to :review
        belongs_to :user
      end
    end
  end
end
