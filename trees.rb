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
		Importación de los módulos nodos.rb, mod_bfs.rb y mod_fold.rb
=end
require "./nodos"
require "./mod_bfs"
require "./mod_fold"

=begin
		Definición de ArbolBinario: clase que representa un árbol binario, con un nodo con algún valor, y dos hijos de dicho nodo

		Variables de instancia:
			- @value: contiene una referencia a una instancia de la clase Nodo (ver módulo nodos.rb). Tipo de acceso: attr_accessor (lectura y escritura)
			- @left: contiene una referencia a una instancia de la clase ArbolBinario (hijo izquierdo). Tipo de acceso: attr_reader (sólo lectura una vez instanciado)
			- @right: contiene una referencia a una instancia de la clase ArbolBinario (hijo derecho). Tipo de acceso: attr_reader (sólo lectura una vez instanciado)
=end
class ArbolBinario

	attr_accessor :value
	attr_reader :left, :right

=begin
		Inclusión de los mixin BFS y DFS (ver mod_bfs.rb y mod_dfs.rb, respectivamente)
=end
	include BFS
	include DFS

=begin
		Método initialize: constructor de la clase ArbolBinario

		Parámetros
			- value: referencia a una instancia de la clase Nodo a almacenar en @value, por defecto nil
			- left: referencia a una instancia de la clase ArbolBinario a almacenarse en @left, por defecto nil
			- right: referencia a una instancia de la clase ArbolBinario a almacenarse en @right, por defecto nil
=end
	def initialize(value=nil, left=nil, right=nil)
		set(value)
		@left = left
		@right = right
	end

=begin
		Método value: retorna el valor de la variable de instancia @value del ArbolBinario

		Retorna:
			- @value: variable de instancia de la clase ArbolBinario
=end
	def valor; return @value.get; end	
	
=begin
		Método set: dado un valor, crea una instancia de la clase Nodo con dicho valor y asigna dicha instancia de la clase Nodo a la variable de instancia @value del ArbolBinario

		Parámetros:
			- new_value: valor a almacenar en el nodo
=end
	def set(new_value)
		@value = Nodo.new(new_value)
	end

=begin
		Método each: iterador sobre los hijos inmediatos de una instancia de la clase ArbolBinario

		Cede: cada uno de los hijos inmediatos de una instancia de la clase ArbolBinario
=end
	def each
		yield (@left) unless @left.nil?
		yield (@right) unless @right.nil?
	end

=begin
		Parámetros:
			- klass: clase en la cual se ejecutará el método de clase mutator
=end
	def mutar(klass); set(klass.mutator(self.valor)); end

end

=begin
		Definición de ArbolRosa: clase que representa un árbol rosa con un nodo con algún valor y sus hijos.

		Variables de instancia:
			- @value: contiene una referencia a una instancia de la clase Nodo (ver módulo nodos.rb). Tipo de acceso: attr_accessor (lectura y escritura)
			- @children: contiene una referencia a un arreglo con instancias de la clase ArbolRosa. Tipo de acceso: attr_reader (sólo lectura una vez instanciado)
=end

class ArbolRosa

	attr_accessor :value
	attr_reader :children

=begin
		Inclusión de los mixin BFS y DFS (ver mod_bfs.rb y mod_dfs.rb, respectivamente)
=end
	include BFS
	include DFS

=begin
		Método initialize: constructor de la clase ArbolRosa

		Parámetros
			- value: referencia a una instancia de la clase Nodo a almacenar en @value, por defecto nil
			- children: referencia a un arreglo de instancias de la clase ArbolRosa a almacenarse en @children, por defecto nil
=end
	def initialize(value=nil, *children)
		set(value)
		@children = []
		children.each {|child| @children << child}
	end
=begin
		Método valor: retorna el valor de la variable de instancia @value del ArbolRosa

		Retorna:
			- @value: variable de instancia de la clase ArbolRosa
=end
	def valor; return @value.get; end

=begin
		Método set: dado un valor, crea una instancia de la clase Nodo con dicho valor y asigna dicha instancia de la clase Nodo a la variable de instancia @value del ArbolRosa

		Parámetros:
			- new_value: valor a almacenar en el nodo
=end
	def set(new_value)
		@value = Nodo.new(new_value)
	end

=begin
		Método each: iterador sobre los hijos inmediatos de una instancia de la clase ArbolRosa

		Cede: cada uno de los hijos inmediatos de una instancia de la clase ArbolRosa
=end
	def each
		unless @children.nil?
			i = 0
			while i < @children.length
				yield @children[i]
				i += 1
			end
		end
	end

=begin
		Parámetros:
			- klass: clase en la cual se ejecutará el método de clase mutator
=end
	def mutar(klass); set(klass.mutator(self.valor)); end
end