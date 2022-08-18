# frozen_string_literal: true

class WithdrawsQuery < ApplicationQuery
  attr_reader :relation, :filters

  def initialize(params)
    @relation = params[:relation]
    @filters = params[:filters] || {}
  end

  def call
    scope = relation.withdraws

    apply_filter(scope, :name)
      .yield_self { |scope| apply_filter(scope, :balance) }
      .yield_self { |scope| apply_filter(scope, :approved) }
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

  def filter_by_balance(scope, value)
    scope.where(balance: value)
  end

  def filter_by_approved(scope, value)
    scope.where(approved: value)
  end
end
