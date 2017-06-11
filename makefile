# [Insert witty comment here]

# start stuff

# Edit these directories if more are needed.
SDIRS		:=	$(CURDIR) src

# The linker configuration file name
LDCFG=ldconfig.cfg

# The name of the VICE label file
VLFILE=used_addresses.txt

# end stuff


PROJ=$(shell basename $(CURDIR))

#EDIS=$(proj)_elfdis.stmp

AS=ca65
LD=ld65
OD=od65

ASFLAGS=--cpu 65816 -U -g
LDFLAGS=-o $(PROJ).bin -C $(LDCFG) -Ln $(VLFILE)

COMP=$(AS) $(ASFLAGS)
COMP2=$(AS) $(ASFLAGS) $(1)
LINK=$(LD) $(1) $(LDFLAGS)


export VPATH	:=	$(foreach dir,$(SDIRS),$(CURDIR)/$(dir))

ASFILES		:=	$(foreach dir,$(SDIRS),$(notdir $(wildcard $(dir)/*.asm)))

ASOBJS=$(ASFILES:.asm=.o)
#ASLSTS=$(ASFILES:.asm=.lst)

all: all_pre $(ASOBJS)
	@#$(call LINK, objs/*.o) && ./tools/dump_readmemh_input.sh
	@#$(call LINK, objs/*.o) && ./tools/dump_readmemh_input.sh && ./tools/dump_readmemh_input_16.sh
	$(call LINK, objs/*.o) && ./tools/dump_readmemh_input.sh

all_pre: 
	mkdir -p objs

$(ASOBJS) : %.o : %.asm
	$(call COMP, $(@:.o=.lst)) $< -o objs/$@

clean:  
	rm -fv *.stmp *.o objs/*.o $(PROJ).bin $(VLFILE) && rmdir objs
