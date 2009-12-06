class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.xml
  # def index
  #   @contracts = Contract.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @contracts }
  #   end
  # end


  def index
    @contracts = Contract.find(:all)
    contracts = Contract.find(:all) do
      if params[:_search] == "true"
        number          =~ "%#{params[:number]}%" if params[:number].present?
        title           =~ "%#{params[:title]}%" if params[:title].present?
        signature_date  =~ "%#{params[:signature_date]}%" if params[:signature_date].present?                
        effective_date     =~ "%#{params[:effective_date]}%" if params[:effective_date].present?
        expiration_date      =~ "%#{params[:expiration_date]}%" if params[:expiration_date].present?        
      end
      paginate :page => params[:page], :per_page => params[:rows]      
      order_by "#{params[:sidx]} #{params[:sord]}"
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => contracts.to_jqgrid_json([:id,:number,:title,:signature_date,:effective_date,:expiration_date], 
                                                         params[:page], params[:rows], contracts.total_entries) }
    end
  end
  

  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.xml
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.xml
  def create
    @contract = Contract.new(params[:contract])

    respond_to do |format|
      if @contract.save
        flash[:notice] = 'Contract was successfully created.'
        format.html { redirect_to(@contract) }
        format.xml  { render :xml => @contract, :status => :created, :location => @contract }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.xml
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        flash[:notice] = 'Contract was successfully updated.'
        format.html { redirect_to(@contract) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to(contracts_url) }
      format.xml  { head :ok }
    end
  end

def alerts
  if params[:id].present?
    alerts = Contract.find(params[:id]).alerts.find(:all) do
      paginate :page => params[:page], :per_page => params[:rows]      
      order_by "#{params[:sidx]} #{params[:sord]}"        
    end
    total_entries = alerts.total_entries
  else
    alerts = []
    total_entries = 0
  end
  respond_to do |format|
    format.json { render :json => alerts.to_jqgrid_json([:id, :alert_date, :title, :contract_number, :contract_title], params[:page], params[:rows], total_entries) }
  end
end




end
