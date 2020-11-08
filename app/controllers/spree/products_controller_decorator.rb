module Spree::ProductsControllerDecorator
  extend ActiveSupport::Concern

  included do
    helper Spree::ReviewsHelper
  end
end

Spree::ProductsController.prepend(Spree::ProductsControllerDecorator)
