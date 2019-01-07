class Admin::ImportLeadsController < Admin::ApplicationController
  before_action :require_admin_user
  before_action do
    "set_current_tab('admin/import')"
  end

  def index
    redirect_to :action => :new
  end

  def new
  end

  def create
    assigned = User.find(params[:import][:assigned_to])
    file = params[:import][:csv_file]

    ImportLead.new(file).import_assigned_to(assigned)

    redirect_to new_admin_import_lead_path, :notice => "Leads successfully imported"
  end
end
