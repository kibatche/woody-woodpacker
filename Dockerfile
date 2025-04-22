FROM ubuntu:latest

WORKDIR /app

RUN apt update && apt install binutils clang make bash nasm -y

COPY ./includes ./includes
COPY ./libft ./libft
COPY ./srcs ./srcs
COPY ./srcs_assembly ./srcs_assembly
COPY ./Makefile ./
COPY ./woody_tests.sh ./
COPY ./resources ./resources
COPY ./bin ./bin


CMD ["sh", "-c", "make debug; bash ./woody_tests.sh"]
