/* impgen.c starts here */
/*   Copyright (C) 1999-2000 Free Software Foundation, Inc.

 This file is part of GNU libtool.

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <stdio.h>		/* for printf() */
#include <unistd.h>		/* for open(), lseek(), read() */
#include <fcntl.h>		/* for O_RDONLY, O_BINARY */
#include <string.h>		/* for strdup() */

/* O_BINARY isn't required (or even defined sometimes) under Unix */
#ifndef O_BINARY
#define O_BINARY 0
#endif

static unsigned int
pe_get16 (fd, offset)
     int fd;
     int offset;
{
  unsigned char b[2];
  lseek (fd, offset, SEEK_SET);
  read (fd, b, 2);
  return b[0] + (b[1]<<8);
}

static unsigned int
pe_get32 (fd, offset)
    int fd;
    int offset;
{
  unsigned char b[4];
  lseek (fd, offset, SEEK_SET);
  read (fd, b, 4);
  return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
}

static unsigned int
pe_as32 (ptr)
     void *ptr;
{
  unsigned char *b = ptr;
  return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
}

int
main (argc, argv)
    int argc;
    char *argv[];
{
    int dll;
    unsigned long pe_header_offset, opthdr_ofs, num_entries, i;
    unsigned long export_rva, export_size, nsections, secptr, expptr;
    unsigned long name_rvas, nexp;
    unsigned char *expdata, *erva;
    char *filename, *dll_name;

    filename = argv[1];

    dll = open(filename, O_RDONLY|O_BINARY);
    if (dll < 1)
	return 1;

    dll_name = filename;

    for (i=0; filename[i]; i++)
	if (filename[i] == '/' || filename[i] == '\\'  || filename[i] == ':')
	    dll_name = filename + i +1;

    pe_header_offset = pe_get32 (dll, 0x3c);
    opthdr_ofs = pe_header_offset + 4 + 20;
    num_entries = pe_get32 (dll, opthdr_ofs + 92);

    if (num_entries < 1) /* no exports */
	return 1;

    export_rva = pe_get32 (dll, opthdr_ofs + 96);
    export_size = pe_get32 (dll, opthdr_ofs + 100);
    nsections = pe_get16 (dll, pe_header_offset + 4 +2);
    secptr = (pe_header_offset + 4 + 20 +
	      pe_get16 (dll, pe_header_offset + 4 + 16));

    expptr = 0;
    for (i = 0; i < nsections; i++)
    {
	char sname[8];
	unsigned long secptr1 = secptr + 40 * i;
	unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
	unsigned long vsize = pe_get32 (dll, secptr1 + 16);
	unsigned long fptr = pe_get32 (dll, secptr1 + 20);
	lseek(dll, secptr1, SEEK_SET);
	read(dll, sname, 8);
	if (vaddr <= export_rva && vaddr+vsize > export_rva)
	{
	    expptr = fptr + (export_rva - vaddr);
	    if (export_rva + export_size > vaddr + vsize)
		export_size = vsize - (export_rva - vaddr);
	    break;
	}
    }

    expdata = (unsigned char*)malloc(export_size);
    lseek (dll, expptr, SEEK_SET);
    read (dll, expdata, export_size);
    erva = expdata - export_rva;

    nexp = pe_as32 (expdata+24);
    name_rvas = pe_as32 (expdata+32);

    printf ("EXPORTS\n");
    for (i = 0; i<nexp; i++)
    {
	unsigned long name_rva = pe_as32 (erva+name_rvas+i*4);
	printf ("\t%s @ %ld ;\n", erva+name_rva, 1+ i);
    }

    return 0;
}
