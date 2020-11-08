module Spree::ProductsControllerDecorator
  def self.prepended(base)
    base.helper Spree::ReviewsHelper
  end

  Spree::ProductsController.prepend self
end