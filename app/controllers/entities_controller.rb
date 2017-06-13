class EntitiesController < ApplicationController
  
  
 
  #show an entity
  def show
    @entiry =Entity.find(params[:entity_id])
    @entity.to_json
  end
  #create an entry
  def create
    @entity = Entity.new(entity_params)
    @entity.save
    
  end
  #delete an entry
  def destroy
     @entity=Entity.find(params[:entity_id])
     if @entity.destroy
       response =  {:result => "success" }
     else
       response =  {:result => "failure" }
     end
        response.to_json
  end
    #specific status about the entity

  def specific_status
    @entity=Entity.find_by(:entity_type=>params[:entity_type],:entity_id=>params[:entity_id])
    @response.entity_type=params[:entity_type]
    @response.count=@entity.count
    @response.to_json
  end
    #retrive status about all tags
  def status_all
    @entity=Entity.all
  
  end

  private
  def entity_params
      params.require(:entity).permit(:entity_type, :entity_id, :tags)
    end
end
