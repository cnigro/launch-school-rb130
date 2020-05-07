# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints each of these names .
# This gets 'z' wrong...
def rot13(text)
  names = text.downcase.split(/[\s-]/)
  delta = 'a'.ord - 1
  rotation = 13

  names.map do |name|
    name.chars.map do |char|
      (((char.ord - delta + rotation) % ('z'.ord - delta)) + delta).chr
    end.join.capitalize
  end.join(' ')
end

# Very elegant (not mine)
def rot13(string)
  string.tr("a-zA-Z", "n-za-mN-ZA-M")
end

p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')
