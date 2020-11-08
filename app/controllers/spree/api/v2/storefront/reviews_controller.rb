module Spree
  module Api
    module V2
      module Storefront
        class ReviewsController < ::Spree::Api::V2::BaseController
          include Spree::Api::V2::CollectionOptionsHelpers

          def index
            spree_authorize! :index, Spree::Review
            reviews = Spree::Review.approved.where(product: product).page(params[:page]).per(params[:per_page])
            render_serialized_payload { serialize_collection(reviews) }
          end

          def create
            spree_authorize! :create, Spree::Review
            params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?

            review = Spree::Review.new(review_attributes)
            review.product = product
            review.user = spree_current_user if spree_user_signed_in?
            review.ip_address = request.remote_ip
            review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
            review.save

            if review.persisted?
              render_serialized_payload { serialize_resource(review) }
            else
              render_error_payload(review.errors.full_messages.to_sentence)
            end
          end

          private

          def product
            @product ||= Spree::Product.friendly.find(params[:product_id])
          end

          def review_attributes
            params.require(:review).permit(:rating, :title, :review, :name, :show_identifier)
          end

          def resource_serializer
            ::Spree::V2::Storefront::ReviewSerializer
          end

          def collection_serializer
            ::Spree::V2::Storefront::ReviewSerializer
          end
        end
      end
    end
  end
end
