class Sample
  attr_reader :id, :file, :code
  
  def initialize(id)
    @id = id
    load_sample
  end
  
  def as_json(*args)
    {
      id: @id,
      file: @file,
      code: @code,
    }
  end
  
  private
  
  def load_sample
    @glimmer_dsl_web_gem_spec = Gem.loaded_specs.map(&:last).find {|s| s.name == 'glimmer-dsl-web'}
    @file = "#{@glimmer_dsl_web_gem_spec.full_gem_path}/lib/glimmer-dsl-web/samples/hello/#{id}.rb"
    begin
      @code = File.read(@file)
    rescue
      @file = "#{@glimmer_dsl_web_gem_spec.full_gem_path}/lib/glimmer-dsl-web/samples/regular/#{id}.rb"
      @code = File.read(@file)
    end
    remove_license_from_code
  end
  
  def remove_license_from_code
    first_non_comment_found = false
    new_code = ''
    @code.lines.each do |line|
      if first_non_comment_found
        new_code += line
      elsif !line.start_with?('#')
        first_non_comment_found = true
      end
    end
    @code = new_code
  end
end
