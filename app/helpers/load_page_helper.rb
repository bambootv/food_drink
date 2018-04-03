module LoadPageHelper
  def load_page
    @page = params[:page].nil? ? 1 : params[:page].to_i
  end
end
