CC = clang
CCFLAGS = -Wall -Wextra -Werror
CCFLAGS_DEBUG = -Wall -Wextra -Werror -g #-fsanitize=address // cause une erreur de SIG_ACCER
SOURCE_DIR = srcs/
SFILES = main.c error_handling.c parse_ehdr_shdr.c
SRCS = $(addprefix ${SOURCE_DIR}, ${SFILES})
ODIR = objs/
ODIR_DEBUG = objs_debug/
OBJS = $(addprefix ${ODIR}, ${SFILES:.c=.o})
OBJS_DEBUG = $(addprefix ${ODIR_DEBUG}, ${SFILES:.c=.o})
LIB_EXE = libft/libft.a
INCL = -I ./includes -I ./libft
LIB_COMPIL = -L./libft -lft
RM = rm -rf
NAME = woody_woodpacker
NAME_DEBUG = woody_woodpacker_debug

all: ${ODIR} ${NAME}
debug: ${ODIR_DEBUG} ${NAME_DEBUG}
${ODIR}:
	mkdir ${ODIR}
${ODIR_DEBUG}:
	mkdir ${ODIR_DEBUG}
${LIB_EXE}:
	@make -C libft
${NAME}: ${LIB_EXE} ${OBJS}
	${CC} ${CCFLAGS} ${OBJS} -o ${NAME} ${INCL} ${LIB_COMPIL}
${ODIR}%.o: ${SOURCE_DIR}%.c
	${CC} ${CCFLAGS} -c $< -o $@ ${INCL}
${NAME_DEBUG}: ${LIB_EXE} ${OBJS_DEBUG}
	${CC} ${CCFLAGS_DEBUG} ${OBJS_DEBUG} -o ${NAME_DEBUG} ${INCL} ${LIB_COMPIL}
${ODIR_DEBUG}%.o: ${SOURCE_DIR}%.c
	${CC} ${CCFLAGS_DEBUG} -c $< -o $@ ${INCL}
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
