require "./LibraryManager"
require "./Library"

lm = LibraryManager.new
l1 = Library.new("docker","1.10",45)
l2 = Library.new("libc", "4.56", 21)
l3 = Library.new("gstreamer", "2.2", 123)
l4 = Library.new("clsa", "3.04", 456)
l5 = Library.new("fastrem","5.6",23)
l6 = Library.new("gcc","10.10",76)
l7 = Library.new("master","1.2",33)
l8 = Library.new("Raph","4.5",7)

lm.add_library(l1)
lm.add_library(l2)
lm.add_library(l3)
lm.add_library(l4)
lm.add_library(l5)
lm.add_library(l6)
lm.add_library(l7)
lm.add_library(l8)



lm.add_dependency(l1,l2)
lm.add_dependency(l2,l3)
lm.add_dependency(l4,l5)
lm.add_dependency(l4,l6)
lm.add_dependency(l8,l6)
lm.add_dependency(l7,l6)

lm.each_dependency(l1) { |e| puts e }
puts "+++"
lm.each_dependency(l4) { |e| puts e }
puts "---"
lm.each_deep_dependency(l1) { |e| puts e }
puts "+++"
lm.each_deep_dependency(l4) { |e| puts e }
puts "---"
lm.each_deep_dependency_while(l1) { |e| puts e }
puts "+++"
lm.each_deep_dependency_while(l4) { |e| puts e }


puts "---"
puts lm.versions()