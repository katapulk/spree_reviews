module Spree
  module V2
    module Storefront
      class FeedbackReviewSerializer < BaseSerializer
        set_type   :feedback_review

        attributes :rating, :comment, :created_at

        belongs_to :review, record_type: :review, serializer: :review
        belongs_to :user,   record_type: :user,    serializer: :user
      end
    end
  end
end
