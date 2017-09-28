/*
 * ndepgen.c - NASM dependencies file generator.
 * Copyright (c) 2002 RET & COM Research.
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>

#define VERSION "1.3"

const char pathsep = '/';		/* Path separator */
const char incdirective[] = "include";  /* Preprocessor include directive */

char *var_suffix = "_dep =", *obj_suffix=".$(O):";

struct {
    int makefilestyle;
    char *prereq;
} options = {0, NULL};

/*
 * Print an error message and exit
 */
void error(char *msg, int errorlevel)
{
  fprintf(stderr, "%s\n", msg);
  exit(errorlevel);
}


/*
 * Print version information
 */
inline void version(void) {
    puts ("ndepgen - NASM dependencies file generator, version " VERSION "\n"
          "Copyright (c) 2002 RET & COM Research. All rights reserved.");
}


/*
 * Print usage and exit
 */
void usage(void)
{
    printf("Usage: ngepgen [options] files\n"
           "Options: -s<suffix>   - specify a suffix for target dependency\n"
           "         -M           - generate Makefile-style dependencies\n"
	   "         -p<prereq>   - include prerequisite in every dependency\n"
	   "         -V           - print defaults\n"
	   "         -v           - print program version\n"
	   "         -h           - get the usage\n");
    exit(0);
}

 
/*
 * Strip non-directory suffix from the path.
 * Returns NULL if path doesn't contain any slashes; otherwise returns
 * directory name with trailing slash.
 */
char *n_dirname(char *s)
{
    char *p = s;

    if (!s) return NULL;
    if ((p = strrchr(s, pathsep)) != NULL) {
	*(++p) = '\0';
	return s;
    } else return NULL;
}


/*
 * Strip directory and suffix from the path.
 */
char *n_basename(char *s, char suffixsep)
{
    char *p = s, *t = s;
  
    if (!s) return NULL; 
    if (suffixsep && ((t = strchr(s, suffixsep)) != NULL)) *t = '\0';
    if ((p = strrchr(s, pathsep)) != NULL) {
	*p++ = '\0';
	return p;
    } else return s;
}

/*
 * Check if a string ends with given suffix
 */
char *n_checksuffix(char *str, const char *suf)
{
    char *p = str, *q;
    
    if (!str || !suf) return NULL;
    p += strlen(str);
    while (p-- != str) {
	if (*p == *suf)
	    if ((q = strstr(p, suf)) != NULL)
		return q;
    };
    return NULL;
}

/*
 * Main
 */
int main(int argc, char *argv[])
{
    FILE *fd, *ft;
    char Buf[128], Buf2[256], Buf3[256];
    char *suffix = NULL, *p, *name, *searchpath = NULL;
    char ppctl = '%';
    int i, wl;

    if (argc<2) usage();
    for (++argv, --argc; argc; ++argv, --argc) {
    	if (*(p = *argv) != '-')
	    break;
	switch(p[1]) {
	    case 's':
		if (!p[2]) error("Invalid suffix", 3);
		suffix = p + 2;
		break;
	    case 'M':
		options.makefilestyle = 1;
		break;
	    case 'p':
	    	if (!p[2]) error("Invalid prerequisite", 3);
	    	options.prereq = p + 2;
	    	break;
	    case 'V':
		printf("Default suffixes: '%s', '%s'\n", var_suffix, obj_suffix);
		exit(0);
	    case 'v':
		version();
		exit(0);
	    case 'h':
	    case '?':
		usage();
	    default:
		error("Unrecognized option. Run with '-h' to get usage", 2);
	}
    }

    if (!suffix) {
	if (options.makefilestyle)
	    suffix = obj_suffix;
	else
	    suffix = var_suffix;
    }
    
    wl = strlen(incdirective);
    for (i = 0; i < argc; i++) {

	/* C preprocessor uses different control character */
	if (n_checksuffix(argv[i], ".c"))
	    ppctl = '#';
	else
	    ppctl = '%';

	/* Open source file */
	fd = fopen(argv[i], "r");
	if (!fd) {
	    if (errno == ENOENT)
	    	fprintf(stderr, "File `%s' not found\n", argv[i]);
	    else
	    	perror("fopen");
	    exit(errno);
	}

	/* First dependency */
	strcpy(Buf2, argv[i]);
	searchpath = n_dirname(Buf2);
	strcpy(Buf3, argv[i]);
	printf("%s%s %s ",n_basename(Buf3, '.'), suffix, argv[i]);

	/* Search for include files */
	while (!feof(fd)) {
	    Buf[0] = 0;
	    fgets(Buf, sizeof(Buf), fd);
	    if (Buf[0] != ppctl)
		continue;
	    if (strncmp(p = Buf+1, incdirective, wl))
		continue;
	    p += wl;
	    while (*p != '"' && *p != '<') {
		if(!p++) error("Invalid include directive syntax", 4);
	    }
	    name = ++p;
	    while (*p != '"' && *p != '>') {
		if(!p++) error("Invalid include directive syntax", 4);
	    }
	    *p = 0;

	    if (searchpath) {
		strcat(strcpy(Buf3,searchpath), name);
		ft = fopen(Buf3, "r");
		if (ft) {
		    fclose(ft);
		    name = Buf3;
		}
	    }
	    printf("%s ", name);
	}

	if (options.prereq) printf("%s", options.prereq);
	putchar('\n');

	fclose(fd);
    }
  return 0;
}
