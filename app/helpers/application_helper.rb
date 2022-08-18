# frozen_string_literal: true

module ApplicationHelper

  def active_class(path)
    'active' if current_page?(path)
  end

  def active_class_multiple(paths)
    paths.include?(request.path) ? 'active' : ''
  end

  def human_purchase_attribute_status
    Purchase.statuses.map { |k, v| [k, Purchase.human_attribute_name("status.#{k}")] }
  end

  def human_attribute_enum(model_name, enum_attr, attr_name)
    Hash[enum_attr.map { |k,v| [I18n.t("activerecord.attributes.#{model_name}/#{attr_name}.#{k}"), k] }]
  end
end
