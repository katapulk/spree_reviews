module Spree::V2::Storefront::ProductSerializerDecorator
  def self.prepended(base)
    base.has_many :reviews
  end

  Spree::V2::Storefront::ProductSerializer.prepend self
end
