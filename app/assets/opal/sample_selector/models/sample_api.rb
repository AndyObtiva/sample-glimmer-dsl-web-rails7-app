# Sample Resource HTTP API that calls Rails Backend Samples API Endpoint
class SampleApi
  class << self
    def show(id, &sample_processor)
      HTTP.get("/samples/#{id}.json") do |response|
        # Wrapping response body with Native to convert from a JS object to an Opal Ruby object,
        # thus converting JS properties into Ruby methods that facilitate interaction with object.
        sample = Native(response.body)
        sample_processor.call(sample)
      end
    end
  end
end
