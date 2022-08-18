# frozen_string_literal: true

class TransactionsQuery < ApplicationQuery
  attr_reader :relation, :filters

  def initialize(params)
    @relation = params[:relation]
    @filters = params[:filters] || {}
  end

  def call
    scope = relation.transactions

    apply_filter(scope, :name)
      .yield_self { |scope| apply_filter(scope, :reference) }
      .yield_self { |scope| apply_filter(scope, :code) }
      .yield_self { |scope| apply_filter(scope, :operation) }
      .yield_self { |scope| apply_filter(scope, :amount) }
      .yield_self { |scope| apply_filter(scope, :point_amount) }
      .yield_self { |scope| apply_filter(scope, :description) }
      .yield_self { |scope| apply_paginate(scope) }
      .yield_self { |scope| apply_limit(scope) }
      .yield_self { |scope| apply_order(scope) }
  end

  private

  def apply_filter(scope, filter)
    return scope if filters[filter].blank?

    send("filter_by_#{filter}", scope, filters[filter])
  end

  def apply_paginate(scope)
    return scope if filters[:page].nil? || filters[:limit].nil?

    scope.page(filters[:page]).per(filters[:limit])
  end

  def apply_limit(scope)
    return scope if filters[:limit].nil?

    scope.limit(filters[:limit])
  end

  def apply_order(scope)
    return scope if filters[:order].nil?

    scope.order(code: :asc) if filters[:order].eql?("code-asc")
    scope
  end

  def filter_by_description(scope, value)
    scope.where("description LIKE :value", value: "%#{value}%")
  end

  def filter_by_reference(scope, value)
    scope.where(reference_id: value)
  end

  def filter_by_code(scope, value)
    scope.where('lower(code) = ?', value.to_s.downcase)
  end

  def filter_by_operation(scope, value)
    scope.where(operation: value)
  end

  def filter_by_amount(scope, value)
    scope.where(amount: value)
  end

  def filter_by_point_amount(scope, value)
    scope.where(point_amount: value)
  end
end
