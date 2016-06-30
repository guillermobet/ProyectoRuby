=begin
		Universidad Simón Bolívar
		Departamento de Computación y Tecnología de la Información
		Laboratorio de Lenguajes de Programación (CI3661)

		Profesores:	- Federico Flaviani
					- Wilmer Pereira
		
		Preparador:	- David Lilue

		Tercer proyecto: Orientación a objetos 

		Autores: 	- Guillermo Betancourt,	carnet 11-10103
					- Gabriel Giménez, 		carnet 12-11006
=end

require_relative "trees.rb"
require_relative "nodos.rb"
require_relative "mod_bfs.rb"
require_relative "mod_fold.rb"

bt = ArbolBinario.new("Hola",ArbolBinario.new(22),ArbolBinario.new(222))
puts "Valor = #{bt.valor}"
bt.set([1,2,3,"Hola",[1,2,3,["Hola", ["chao", 3], 2, []]]])
bt.each {|x| puts x.valor}
puts "Valor nuevo = #{bt.valor}"
puts ""
rt = ArbolRosa.new(3, ArbolRosa.new(7),
						ArbolRosa.new(-2,
							ArbolRosa.new(-16),
							ArbolRosa.new(12)),
						ArbolRosa.new(3),
						ArbolRosa.new(-1))
rt.set(100)
print "--------------\n"
puts "\nValor rt = #{rt.children}"
print "#{bt.bfs {|x| puts x}}"
rt.each {|x| puts x.valor}
puts "#{rt.children}"
print "\n"
print "--------------\n"
bt.bfs {|subtree| puts subtree.valor}
print "#{bt.bfs {|node_value| puts node_value}}"
rt.bfs {|x| puts x}
print "\n"
positive = lambda {|x| x.valor > 0}
puts "#{rt.recoger(positive)}"
bt = ArbolBinario.new("Hello World!",
		ArbolBinario.new(22),
		ArbolBinario.new(222))
puts bt.valor
arr = [1,2,3,[1,2,3,["Hola", ["chao", 3], 2]]]
bt = ArbolBinario.new(arr)
bt.mutar(Oscuro)
print bt.valor
print "\n"
br = ArbolBinario.new("Hola",ArbolBinario.new(22),ArbolBinario.new(222))
rt = ArbolRosa.new(12345,
		ArbolRosa.new(2),
		 ArbolRosa.new(3,
		 	ArbolRosa.new(4, ArbolRosa.new(5, ArbolRosa.new(6, ArbolRosa.new(7)))),
			 ArbolRosa.new(8)),
		 ArbolRosa.new(9),
		 ArbolRosa.new(10))
x = rt.fold(0) {|subtree, acc|  subtree.valor + acc}
puts x
rt.dfs {|x| puts "#{x.valor}"}

y = rt.recoger(lambda {|x| x.valor.odd?})
z = rt.dfs {|x| puts x.valor if x.valor.odd?}

rt.mutar(Oscuro)
puts "----------"
puts rt.valor