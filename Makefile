versione=`0.1.3`

crea:
	mix hex.build
	git tag -a $(versione) -m $(versione)
	git push origin $(versione)
pub: 
	mix hex.publish
tag: 
	git tag -a $(versione) -m  $(versione)