class ApplicationController < ActionController::Base

  def define_filters(filter_name, default: {})
    filter_by_url = request.GET.reject { |field, _| %W(utf8 format commit action controller).include?(field) }

    if filter_by_url.any?
      @filters = Filter.new(fields: request.GET)
    else
      unless params[:clear_filter].blank? || session[filter_name].blank?
        @filters = Filter.new(fields: session[filter_name])
      else
        @filters = Filter.new(fields: default)
      end
    end

    session[filter_name] = @filters.to_s

    logger.info { "Filtro utilizado: #{@filters.fields.inspect}" }

    @filters
  end
end
