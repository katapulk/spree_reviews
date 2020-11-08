module Spree::Api::ApiHelpersDecorator
  def self.prepended(base)
    reviews_fields = [:avg_rating, :reviews_count]
    reviews_fields.each { |attrib| Spree::PermittedAttributes.product_attributes << attrib }
    reviews_fields.each do |attrib|
      base.class_variable_set(:@@product_attributes, base.class_variable_get(:@@product_attributes).push(attrib))
    end
  end

  Spree::Api::ApiHelpers.prepend self
end
