class Publicity::HelpsController < InheritedResources::Base
    respond_to :js, :only => [:show, :fade]

  def fade
    @help = Publicity::Help.find(params[:id])
  end
  def build_resource_params
    [params.fetch(:publicity_help, {}).permit(:title, :content)]
  end
end
