# frozen_string_literal: true

##
# Decorate `List` for display in list views.
#
# @see https://ruby-doc.org/stdlib-2.7.1/libdoc/delegate/rdoc/Delegator.html
class ListShow < SimpleDelegator
  ##
  # @return [Enumerable<ItemShow>]
  def list_items
    super.map do |item|
      ItemShow.new(item)
    end
  end

  ##
  # Wraps the parent model's name, with a guaranteed return type.
  #
  # @return [String]
  def name
    super || 'Unnamed List'
  end

  ##
  # @return [String] a url/css-friendly slug for this list
  def slug
    name.downcase.gsub(' ', '_')
  end
end
