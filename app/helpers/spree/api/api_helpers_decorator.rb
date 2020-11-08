module Spree::Api::ApiHelpersDecorator
  extend ActiveSupport::Concern

  included do
    reviews_fields = [:avg_rating, :reviews_count]
    reviews_fields.each { |attrib| Spree::PermittedAttributes.product_attributes << attrib }

    reviews_fields.each { |attrib| class_variable_set(:@@product_attributes, class_variable_get(:@@product_attributes).push(attrib)) }
  end
end

Spree::Api::ApiHelpers.prepend(Spree::Api::ApiHelpersDecorator)