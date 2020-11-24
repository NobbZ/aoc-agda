AGDA_SRC=$(shell find . -name '*.agda')
AGDA_INT=$(shell find . -name '*.agdai')
BINS=aoc-agda

all: aoc-agda

run: aoc-agda
	./aoc-agda

clean: $(AGDA_INT:%=%_clean) $(BINS:%=%_clean) MAlonzo_dirclean

aoc-agda: aoc-agda.agda $(AGDA_SRC)
	agda -c $<

%_clean:
	rm -f $*

%_dirclean:
	rm -rfv $*
