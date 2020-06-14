# frozen_string_literal: true

##
# Decorate `ListItem` for display in list views.
#
# @see https://ruby-doc.org/stdlib-2.7.1/libdoc/delegate/rdoc/Delegator.html
class ItemShow < SimpleDelegator
  ##
  # Wraps the parent model's name, with a guaranteed return type.
  #
  # @return [String]
  def name
    super || 'Unknown Item'
  end

  ##
  # @return [String] a url/css-friendly slug for this list
  def slug
    name.downcase.gsub(' ', '_')
  end
end
