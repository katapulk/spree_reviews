module Spree
  module V2
    module Storefront
      class ReviewSerializer < BaseSerializer
        set_type   :review

        attributes :name, :location, :rating, :title, :review, :created_at

        attribute :is_approved,  &:approved?

        belongs_to :product,   record_type: :product, serializer: :product
        belongs_to :user,      record_type: :user,    serializer: :user

        has_many   :feedback_reviews, record_type: :feedback_review, serializer: :feedback_review
      end
    end
  end
end
