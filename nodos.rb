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
		Reapertura de la clase Fixnum: se agregan algunos métodos para las operaciones con mutadores
=end
class Fixnum

=begin
		Método set_value: devuelve la misma instancia de la clase Fixnum

		Retorna:
			- self: la misma instancia de la clase Fixnum
=end
	def set_value; return self; end

=begin
		Método check_type: retorna true dado que Fixnum es una clase válida

		Retorna:
			- true
=end
	def check_type; return true; end

=begin
		Método singular: muta la instancia de la clase Fixnum de manera singular

		Retorna:
			- El resultado de mutar la instancia de la clase Fixnum de forma singular
=end
	def singular
		if (self.abs / 10) == 0
			return self
		else
			div = self.abs
			acc = 0
			while div >= 10
				acc += div % 10
				div /= 10
			end
			return acc * div * (self <=> 0)
		end
	end

=begin
		Método uniforme: muta la instancia de la clase Fixnum de manera uniforme

		Retorna:
			- El resultado de mutar la instancia de la clase Fixnum de forma uniforme
=end
	def uniforme
		if (self.abs / 10) == 0
			return self
		else
			div = self.abs
			avg = 0
			pos = 0
			until div == 0
				avg += div % 10
				div /= 10
				pos += 1
			end
			return (avg.to_f / pos).round
		end
	end

=begin
		Método oscuro: muta la instancia de la clase Fixnum de manera oscura

		Retorna:
			- El resultado de mutar la instancia de la clase Fixnum de forma oscura
=end
	def oscuro
		if (self.abs / 10) == 0
			return self
		else
			div = self.abs
			num = 0
			pos = 1
			until div == 0
				if pos % 2 == 0
					num += (div % 10) * (10 ** ((pos / 2) - 1))
				end
				div /= 10
				pos += 1
			end
			return num * (self <=> 0)
		end
	end
end

=begin
		Reapertura de la clase String: se agregan algunos métodos para las operaciones con mutadores
=end
class String

=begin
		Método set_value: devuelve la misma instancia de la clase String

		Retorna:
			- self: la misma instancia de la clase String
=end
	def set_value; return self; end

=begin
		Método check_type: retorna true dado que String es una clase válida

		Retorna:
			- true
=end
	def check_type; return true; end

=begin
		Método singular: muta la instancia de la clase String de manera singular

		Retorna:
			- El resultado de mutar la instancia de la clase String de forma singular
=end
	def singular
		singular_str = ""
		for i in 0..(self.length - 1)
			if "singular".include?(self[i])
				singular_str << self[i].upcase
			else
				singular_str << self[i]
			end
		end
		return singular_str
	end

=begin
		Método uniforme: muta la instancia de la clase String de manera uniforme

		Retorna:
			- El resultado de mutar la instancia de la clase String de forma uniforme
=end
	def uniforme
		uniform_str = ""
		for i in 0..(self.length - 1)
			if i % 2 == 0
				uniform_str << self[i].upcase
			else
				uniform_str << self[i].downcase
			end
		end
		return uniform_str
	end

=begin
		Método oscuro: muta la instancia de la clase String de manera oscura

		Retorna:
			- El resultado de mutar la instancia de la clase String de forma oscura
=end
	def oscuro
		left_str = ""
		right_str = ""
		for i in 0...self.length
			if i % 2 == 0 then right_str << self[i] else left_str << self[i] end
		end
		left_str << right_str
		return left_str
	end
end

=begin
		Reapertura de la clase Array: se agregan algunos métodos para las operaciones con mutadores
=end
class Array

=begin
		Método set_value: verifica que los elementos del arreglo sean válidos, y retorna la misma instancia de la clase Array

		Retorna:
			- self: la misma instancia de la clase Array
=end
	def set_value
		if self.check_type then return self else raise "ArrayInvalidElement" end
	end

=begin
		Método check_type: verifica que los elementos del arreglo sean instancias de clases válidas.

		Retorna:
			- checked: variable que almacena true si los elementos del arreglo son válidos, false en caso contario
=end
	def check_type
		checked = true
		self.each { |elem|
			begin
				checked = checked && elem.check_type
				break unless checked
			rescue NoMethodError
				return false
			end
		}
		return checked
	end

=begin
		Método singular: muta la instancia de la clase Array de manera singular

		Retorna:
			- El resultado de mutar la instancia de la clase Array de forma singular
=end
	def singular
		return self.join(" ")
	end

=begin
		Método uniforme: muta la instancia de la clase Array de manera uniforme

		Retorna:
			- El resultado de mutar la instancia de la clase Array de forma uniforme
=end
	def uniforme
		uniform_arr = []
		self.each {|elem| uniform_arr.push(elem.uniforme)}
		return uniform_arr
	end

=begin
		Método oscuro: muta la instancia de la clase Array de manera oscura

		Retorna:
			- El resultado de mutar la instancia de la clase Array de forma oscura
=end
	def oscuro
		obscure_arr = self
		index_arr = (0...obscure_arr.length).to_a.shuffle.slice(0, obscure_arr.length / 2)
		for i in 0...(index_arr.length)
			obscure_arr[index_arr[i]] = (obscure_arr[index_arr[i]].oscuro)
		end
		return obscure_arr
	end
end

=begin
		Definición de Nodo: clase que guarda el valor de un nodo en un ArbolBinario o un ArbolRosa
=end
class Nodo

=begin
		Método initialize: constructor de la clase Nodo

		Parámetros
			- value: referencia a una instancia de la clase cualquiera
=end
	def initialize(value); set(value); end

=begin
		Método get: retorna el valor de la variable de instancia @node_value del Nodo

		Retorna:
			- @value: variable de instancia de la clase Nodo
=end
	def get; return @node_value; end

=begin
		Método set: dado un valor, lo asigna a la variable de instancia @node_value si el valor es instancia de una clase válida

		Parámetros:
			- value: valor a evaluar para ser asignado
=end
	def set(value);	@node_value = value.set_value; end
end


=begin
		Simulación de una clase de abstracta Mutator
=end
class Mutador
	def initialize; raise "Mutador is an abstract class, it cannot be instantiated"; end
	def mutator(inst); end
end

=begin
		Clase Singular, hereda de Mutador, con un método de clase llamado mutator, que ejecuta el método singular sobre una instancia dada
=end
class Singular < Mutador
	def inicialize; end
	def self.mutator(inst)
		return inst.singular
	end
end

=begin
		Clase Uniforme, hereda de Mutador, con un método de clase llamado mutator, que ejecuta el método singular sobre una instancia dada
=end
class Uniforme < Mutador
	def inicialize; end
	def self.mutator(inst)
		return inst.uniforme
	end
end

=begin
		Clase Oscuro, hereda de Mutador, con un método de clase llamado mutator, que ejecuta el método singular sobre una instancia dada
=end
class Oscuro < Mutador
	def inicialize; end
	def self.mutator(inst)
		return inst.oscuro
	end
end
