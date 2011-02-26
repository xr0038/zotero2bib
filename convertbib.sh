#!/bin/bash

target=${1:-src.bib}
output=${2:-master.bib}

./bib_texchr ${target} \
		|./bib_longname \
		|sed 's/{Astronomy and Astrophysics/{\\aap/' \
		|sed 's/{\(The \)*Astrophysical Journal/{\\apj/' \
		|sed 's/{\\apj Supplement Series/{\\apjs/' \
		|sed 's/{Monthly Notices of the Royal Astronomical Society/{\\mnras/' \
		|sed 's/{\(The \)*Astronomical Journal/{\\aj/' \
		|sed 's/{Publications .* Japan/{\\pasj/' \
		> ${output}
##

grep '[^A-z]title =\|^@' ${output} \
		|sed 's/title = {\(.*\)},/\1\n/' \
		|sed 's/@\w*{\(.*\),/## \1/'
