# frozen_string_literal: true

class SponsoredQuery < ApplicationQuery
  attr_reader :relation, :filters

  def initialize(params)
    @relation = params[:relation]
    @filters = params[:filters] || {}
  end

  def call
    scope = relation.sponsored

    apply_filter(scope, :name)
      .yield_self { |scope| apply_filter(scope, :name) }
  end

  private

  def apply_filter(scope, filter)
    return scope if filters[filter].blank?

    send("filter_by_#{filter}", scope, filters[filter])
  end

  def filter_by_name(scope, value)
    scope.joins(:profile)
      .where("profiles.first_name ILIKE :value", value: "%#{value}%")
  end
end
