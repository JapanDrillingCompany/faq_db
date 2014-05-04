class Publicity::HelpsController < InheritedResources::Base

  def build_resource_params
    [params.fetch(:publicity_help, {}).permit(:title, :content)]
  end
end
