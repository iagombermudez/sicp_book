(car ''abracadabra)
; This is the same as the following:
(car (quote (quote abracadabra)))
; Which is the same as
(car (list 'quote (list 'quote 'abracadabra)))
; so it returns the symbol 'quote, since it's the first element of the list
