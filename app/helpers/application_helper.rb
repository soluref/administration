module ApplicationHelper

	# Retourner un titre basé sur la page.
	def titrePage
		base_titre = "Application publique"
		if @titrePage.nil? || @titrePage.empty?
			base_titre
		else
		  "#{@titrePage} de l'application"
		end
	end
  
	def string_message(string)
		if string.empty?
			"C'est une chaine vide !"
		else
			"La chaine n'est pas vide."
		end
	end  
end

# les égalités
# ==
# != 
# >
# >=

# les tableaux ---------------------------------------------

# @donnee = "foo bar     baz".split  =>["foo","bar",baz"]
# @donnee = "fooxbarxbaz".split("x")  =>["foo", "bar", "baz"]
# @donnee[0], # @donnee[1]...
# @donnee[-1] = "baz"
# @donnee.last = "baz"
# @donnee.first = "foo"
# @donnee.second = "bar"

# @donnee.sort => ["bar", "baz", "foo"]
# @donnee.reverse => ["foo", "baz", "bar"]
# @donnee.shuffle => ["foo", "bar", "baz"]
# @donnee<<7 => ["bar", "baz", "foo",7]
# @donnee << 9 << 8 => ["bar", "baz", "foo",7,9,8]
# @donnee.join => "barbazfoo798"
# @donnee.join ',' => "bar,baz,foo,7,9,8"

# ('a'..'e').to_a => ["a", "b", "c", "d", "e"]
# ('0..4).to_a => [0, 1, 2, 3, 4]
