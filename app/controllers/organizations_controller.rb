class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    @organizations_geo = Organization.geocoded
    @markers = @organizations_geo.map do |organization|
      {
        lat: organization.latitude,
        lng: organization.longitude,
        infoWindow: render_to_string(partial: "organizations/info_window", locals: { organization: organization }),
      }
    end
  end
end
