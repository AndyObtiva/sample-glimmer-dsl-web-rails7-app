# TODO move to glimmer-dsl-web
class ResourceService
  class << self
    def create(resource, singular_resource_name: nil, plural_resource_name: nil, create_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      create_resource_url ||= "/#{plural_resource_name}.json"
      HTTP.post(create_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
    end
    
    def update(resource, singular_resource_name: nil, plural_resource_name: nil, update_resource_url: nil, &response_handler)
      singular_resource_name ||= singular_resource_name_for(resource)
      plural_resource_name ||= "#{singular_resource_name}s"
      update_resource_url ||= "/#{plural_resource_name}/#{resource.id}.json"
      HTTP.patch(update_resource_url, payload: resource_paramters(resource, singular_resource_name:), &response_handler)
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
