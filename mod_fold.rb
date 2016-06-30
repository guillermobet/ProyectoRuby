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
		Mixin DFS: contiene dos métodos llamados dfs y fold
=end
module DFS

=begin
		Método dfs: dado un ArbolBinario o un ArbolRosa, cede cada uno de sus nodos como subárboles en un recorrido en profundidad 
=end
	def dfs
		stack = []
		stack.push(self) unless self.nil?
		while stack.size > 0
			subtree = stack.shift
			yield subtree
			tmp_list = []
			subtree.each {|child| tmp_list.push(child)}
			stack = tmp_list + stack
		end
	end

=begin
		Método fold: dado un ArbolBinario o un ArbolRosa y un valor base, cede cada uno de los subárboles junto al acumulador actualizado para ser operados en el bloque implícito
=end
	def fold(base)
		stack = []
		stack.push(self) unless self.nil?
		var = base
		while stack.size > 0
			subtree = stack.shift
			var = yield(subtree, var)
			tmp_list = []
			subtree.each {|child| tmp_list.push(child)}
			stack = tmp_list + stack
		end
		return var
	end
end