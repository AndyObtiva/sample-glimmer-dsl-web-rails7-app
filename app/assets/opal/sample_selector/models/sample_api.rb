# Sample Resource HTTP API that calls Rails Backend Samples API Endpoint
class SampleApi
  class << self
    def show(id, &sample_processor)
      HTTP.get("/samples/#{id}.json") do |response|
        sample = Native(response.body)
        sample_processor.call(sample)
      end
    end
  end
end
