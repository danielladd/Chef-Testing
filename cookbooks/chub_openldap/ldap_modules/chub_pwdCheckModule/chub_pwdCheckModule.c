#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MINCLASSES 3

int init_module()
{
	return 0;
}

const char *lower = "abcdefghijklmnopqrstuvwxyz";
const char *upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const char *digit = "0123456789";
const char *other = " `~!@#$%^&*()-_=+[]{}\\|;':\",./<>?";

int check_password(char *pPasswd, char **ppErrStr, void *arg)
{
	int pwqr=0;
	char retmsg[256];
	char *message;
	int charclasses=0;

	if ( strpbrk(pPasswd, lower) != NULL) {
		charclasses++;
	}
	if ( strpbrk(pPasswd, upper) != NULL) {
		charclasses++;
	}
	if ( strpbrk(pPasswd, digit) != NULL) {
		charclasses++;
	}
	if ( strpbrk(pPasswd, other) != NULL) {
		charclasses++;
	}

	if (charclasses < MINCLASSES) {
		pwqr=1;
		snprintf(retmsg, 256, "Insufficient character classes (Had: %d, Need: %d)", charclasses, MINCLASSES);
		message = malloc(strlen(retmsg)+1);
		strcpy(message, retmsg);
		*ppErrStr=message;
	}

	return pwqr;
}
