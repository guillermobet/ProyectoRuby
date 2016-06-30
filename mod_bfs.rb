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

=begin
		Mixin BFS: contiene dos métodos llamados bfs y recoger
=end
module BFS

=begin
		Método bfs: dado un ArbolBinario o un ArbolRosa, cede cada uno de sus nodos como subárboles en un recorrido en amplitud (por niveles)
=end
	def bfs
		queue = [] 
		queue.push(self) unless self.nil?
		while queue.size > 0
			current = queue.shift
			yield current
			current.each {|child| queue.push(child)} unless current.nil? 
		end
	end

=begin
		Método recoger: dado un árbol y un bloque de código con una condición, se inserta el valor de los nodos que cumplan con la condición del bloque en una lista y se retorna dicha lista
=end
	def recoger(block)
		queue = []
		accomplish_block = []
		queue.push(self) unless self.nil?
		while queue.size > 0
			current = queue.shift
			accomplish_block.push(current.valor) if block.call(current)
			current.each {|child| queue.push(child)} unless current.nil? 
		end
		return accomplish_block
	end
end