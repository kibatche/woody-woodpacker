# Woody Woodpacker

Un petit projet 42 qui vise à programmer un packer pour fichiers ELF 64 bits. Mais plutôt qu'un vrau packer, il s'agit ici en fait un "virus" qui imprime le tableau de caractère "....WOODY...." avant le "vrai" lancement du programme.

Comment ça fonctionne ?

Un fichier ELF de type exécutable ou dynamique (ET_EXEC/ET_DYN) contient systématiquement un entrypoint, c'est à dire le point d'entrée de l'exécution du programme situé dans la section .text.

Pour inférer le fonctionnement du programme, de multiples méthodes existent. L'une d'entre-elle consiste à "caler" notre parasite entre deux segments de type "PT_LOAD", qui sont les segments essentiels à l'exécution du programme.

Chaque segment à des propriétés, dont l'une d'entre elle consiste à ce que ledit segment soit lisible/exécutable. Nous allons donc changer cette propriété du segment si jamais il n'est pas exécutable, et changer le point d'entrée du fichier sur l'adresse mémoire du parasite.

Le parasite quant à lui va "simplement" se charger d'imprimer le tableau de caractères "....WOODY....", de déchiffrer ce qui est chiffré, puis de rendre la "main" au point d'entrée original du fichier, qui va pouvoir s'exécuter normalement.

## Cela fonctionne-t-il pour tous les fichiers ?

Non. La principale faiblesse de cette manière de procéder est qu'il faut assez de place entre deux segments LOAD pour placer notre parasite. Si pas assez de place, alors impossible avec cette méthode d'interférer avec le fichier elf.

## ET_DYN, c'est un fichier dynamique non ? Comment connaître l'adresse avec un binaire PIE et l'ASLR d'activé ?

Question que je me suis posée et que je pose donc ici, car la plupart des papiers / vidéos décrivant l'injection d'un ELF le font sur des binaires non pie (-no-pie avec gcc).

Il y a deux méthodes pour retourner à l'adresse chargée dynamiquement. Soit en soustrayant/additionnant la différence entre le début de notre parasite (représenté par une label en asm) et l'entrypoint original, et en faisant un jump sur cette différence.

Concrètement, ça donne cela :

```assembly
lea r10, [rel woody +/- 0xdiff]; woody est un label en début de fichier
```

Soit en soustrayant/additionnant la même différence sur le registre `r12` dès le début de l'exécution. Le registre r12 contient en x86_64 systématiquement l'entrypoint de l'ELF (de type EXEC/DYN bien sûr) càd le point d'entrée concernant notre parasite. Ainsi il suffit juste, une fois cette soustraction/addition d'opérée, de jump vers l'adresse pointée par le registre.

## Usage

```bash
make
./woody_woodpacker FILE
./woody
```

## Tests

Pour tester le programme, nous le construisons dans un conteneur Docker à partir de la dernière image d'Ubuntu.

En effet, si nous le testons dans notre système d'exploitation, tous les programmes parasités (càd `Woody` ») seront exécutés. Un excellent moyen de bloquer, voire de détruire définitivement notre système d'exploitation ! Ce n'est pas ce que nous souhaitons.

Usage :

```bash
bash main_test.sh
```

