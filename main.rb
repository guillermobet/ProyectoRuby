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

require "./trees"

bt = ArbolBinario.new("Hola",ArbolBinario.new(22),ArbolBinario.new(222))
puts "Valor = #{bt.get.get}"
bt.set([1,2,3,"Hola",[1,2,3,["Hola", ["chao", 3], 2, []]]])
bt.each {|x| puts x.get.get}
puts "Valor nuevo = #{bt.get.get}"
puts ""
rt = ArbolRosa.new(3, [ArbolRosa.new(7),
						ArbolRosa.new(-2,
							[ArbolRosa.new(-16),
							ArbolRosa.new(12)]),
						ArbolRosa.new(3),
						ArbolRosa.new(-1)])
rt.set(100)
print "--------------\n"
puts "\nValor rt = #{rt.children}"
print "#{bt.bfs {|x| puts x}}"
rt.each {|x| puts x.get.get}
puts "#{rt.children}"
print "\n"
print "--------------\n"
bt.bfs {|subtree| puts subtree.get.get}
print "#{bt.bfs {|node_value| puts node_value}}"
rt.bfs {|x| puts x}
print "\n"
positive = lambda {|x| x.get.get > 0}
puts "#{rt.recoger(&positive)}"
bt = ArbolBinario.new("Hello World!",
		ArbolBinario.new(22),
		ArbolBinario.new(222))
puts bt.get.get
arr = [1,2,3,[1,2,3,["Hola", ["chao", 3], 2]]]
bt = ArbolBinario.new(arr)
bt.get.mutar(Singular)
print bt.get.get
print "\n"
br = ArbolBinario.new("Hola",ArbolBinario.new(22),ArbolBinario.new(222))
rt = ArbolRosa.new(12345,
		[ArbolRosa.new(2),
		 ArbolRosa.new(3,
		 	[ArbolRosa.new(4, [ArbolRosa.new(5, [ArbolRosa.new(6, [ArbolRosa.new(7)])])]),
			 ArbolRosa.new(8)]),
		 ArbolRosa.new(9),
		 ArbolRosa.new(10)])
x = rt.fold(0) {|subtree, acc|  subtree.get.get + acc}
puts x