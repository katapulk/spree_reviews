module Spree
  module V2
    module Storefront
      class ReviewSerializer < BaseSerializer
        set_type   :review

        attributes :name, :location, :rating, :title, :review, :created_at

        attribute :is_approved,  &:approved?

        belongs_to :product
        belongs_to :user

        has_many   :feedback_reviews
      end
    end
  end
end
