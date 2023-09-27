def french_phone_number?(phone_number)
  # TODO: true or false?
  zero = /^(\+33)?[^2][^0]((\s|-)?\d{2}){4}$/
  phone_number.match?(zero)
  # ((\s-)?\d{2})*
  # (\+33)?[^2][^0]\s buscar 33 y contempla inicio sin 2 y sin 0
end
