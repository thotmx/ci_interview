class DirtyTester
  def run
    self.class.instance_methods(false).each do |method|
      send(method) unless method == :run
    end
  end
end

