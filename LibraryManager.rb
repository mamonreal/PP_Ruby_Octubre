require "./Library"

class LibraryManager
  def initialize
    @libraries = []
  end
  
  def add_library(l)
    @libraries << l
  end
  
  #The library l1 depends on the library l2
  def add_dependency(l1, l2)
    l1.add_dependency(l2)
  end
  
  def list_size
    @libraries.collect { |l| l.name_size }
  end
  
  def versions
    dictionary = Hash.new
    @libraries.each do |l|
      dictionary[l.name] = l.version
    end
    dictionary
  end
  
  def each_dependency(l)
    l.each_dependency { |l| yield l }
  end
  
  
  def each_deep_dependency(l)
    l.each_deep_dependency([]) { |l| yield l }
  end
  
  def each_deep_dependency_while(l)
    l.each_deep_dependency_while { |l| yield l }
  end
end