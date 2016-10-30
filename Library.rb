class Library
  def initialize(name, version, size)
    @name = name
    @version = version
    @size = size
    @dependencies = []
  end
  
  def to_s
    "#{@name}, #{@version}, #{@size}"
  end
  
  def name_size
      "(#{@name} - #{@size})"
    end
  
  def add_dependency(l)
    @dependencies << l
  end
  
  def each_dependency
    @dependencies.each { |l| yield l }
  end
  
  def each_deep_dependency(visited)
    v = visited
    @dependencies.each do |l|
      if ! v.include?(l)
        yield l 
        v << l             
        l.each_deep_dependency(v) { |l| yield l }
      end
    end
  end
  
  def each_deep_dependency_while
    dep = @dependencies
    visited = []
    while ! dep.empty?()
      l = dep.shift
      if ! visited.include?(l)
        dep = l.passDependency(dep)
        yield l
        visited << l
      end
    end
  end
  
  def passDependency(dep)
    @dependencies + dep
  end
  
  attr_reader :name, :version
    
end