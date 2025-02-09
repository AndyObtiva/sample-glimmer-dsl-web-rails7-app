# TODO move to glimmer-dsl-web
class ResourceService
  class << self
    # TODO
    def index(resource, singular_resource_name: nil, plural_resource_name: nil, index_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      index_resource_url ||= "/#{plural_resource_name}.json"
      # TODO consider supporting reousrce_url arg too (general /models.json that can figure out the rest)
      HTTP.post(index_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
    end
    
    # TODO
    def show(resource, singular_resource_name: nil, plural_resource_name: nil, show_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      create_resource_url ||= "/#{plural_resource_name}.json"
      HTTP.post(create_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
    end
    
    def create(resource, singular_resource_name: nil, plural_resource_name: nil, create_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      create_resource_url ||= "/#{plural_resource_name}.json"
      HTTP.post(create_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
    end
    
    # TODO
    def update(resource, singular_resource_name: nil, plural_resource_name: nil, create_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      create_resource_url ||= "/#{plural_resource_name}.json"
      HTTP.post(create_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
    end
    
    def destroy(resource, singular_resource_name: nil, plural_resource_name: nil, destroy_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      destroy_resource_url ||= "/#{plural_resource_name}/#{resource.id}.json"
      HTTP.delete(destroy_resource_url, payload: {authenticity_token:}, &response_handler)
    end
    
    def resource_paramters(resource, singular_resource_name: nil)
      singular_resource_name ||= singular_resource_name_for(resource)
      paramters = {authenticity_token:}
      paramters[singular_resource_name] = resource.to_h.reject { |attribute, value| value.nil? }
      paramters
    end
    
    def authenticity_token
      Element['meta[name=csrf-token]'].attr('content')
    end
    
    def singular_resource_name_for(resource)
      resource.class.to_s.split('::').last.downcase
    end
  end
end
