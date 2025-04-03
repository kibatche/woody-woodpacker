CC = clang
CCFLAGS = -Wall -Wextra -Werror
CCFLAGS_DEBUG = -Wall -Wextra -Werror -g #-fsanitize=address // cause une erreur de SIG_ACCER
CCFLAGS_TEST = 
SOURCE_DIR = srcs/
TEST_DIR = resources/
TFILES = sample.c
SFILES = main.c error_handling.c parse_ehdr_shdr.c
SRCS = $(addprefix ${SOURCE_DIR}, ${SFILES})
ODIR = objs/
ODIR_DEBUG = objs_debug/
ODIR_TEST = objs_tests/
OBJS = $(addprefix ${ODIR}, ${SFILES:.c=.o})
OBJS_DEBUG = $(addprefix ${ODIR_DEBUG}, ${SFILES:.c=.o})
OBJS_TEST = $(addprefix ${ODIR_TEST}, ${TFILES:.c=.o})
LIB_EXE = libft/libft.a
INCL = -I ./includes -I ./libft
LIB_COMPIL = -L./libft -lft
RM = rm -rf
NAME = woody_woodpacker
NAME_DEBUG = woody_woodpacker_debug
NAME_TEST = test_binary

all: ${ODIR} ${NAME}
debug: ${ODIR_DEBUG} ${NAME_DEBUG} test
test: ${ODIR_TEST} ${NAME_TEST}
${ODIR}:
	mkdir ${ODIR}
${ODIR_DEBUG}:
	mkdir ${ODIR_DEBUG}
${ODIR_TEST}:
	mkdir ${ODIR_TEST}
${LIB_EXE}:
	@make -C libft
#main file
${NAME}: ${LIB_EXE} ${OBJS}
	${CC} ${CCFLAGS} ${OBJS} -o ${NAME} ${INCL} ${LIB_COMPIL}
${ODIR}%.o: ${SOURCE_DIR}%.c
	${CC} ${CCFLAGS} -c $< -o $@ ${INCL}

#debug file
${NAME_DEBUG}: ${LIB_EXE} ${OBJS_DEBUG}
	${CC} ${CCFLAGS_DEBUG} ${OBJS_DEBUG} -o ${NAME_DEBUG} ${INCL} ${LIB_COMPIL}
${ODIR_DEBUG}%.o: ${SOURCE_DIR}%.c
	${CC} ${CCFLAGS_DEBUG} -c $< -o $@ ${INCL}

#test file
${NAME_TEST}: ${OBJS_TEST}
	${CC} ${OBJS_TEST} -o ${NAME_TEST}
${ODIR_TEST}%.o: ${TEST_DIR}%.c
	${CC} ${CCFLAGS_TEST} -c $< -o $@

clean:
	${RM} ${ODIR}
	${RM} ${ODIR_DEBUG}
	@make -C libft clean
fclean:
	${RM} ${ODIR}
	${RM} ${ODIR_DEBUG}
	${RM} ${NAME}
	${RM} ${NAME_DEBUG}
	@make -C libft fclean
re: fclean
	@make -j `nproc` all
redebug: fclean debug
.PHONY:	all clean re fclean
