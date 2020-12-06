#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>

#define SIZESTACK (1024 * 1024)

int child_proc(int *ar)
{
	int ans = 0;
	for (int i = 0; i < 4; i++) {
		ans += ar[i];
	}
	printf("%d\n", ans);
	printf("GOVNO\n");
	return 0;
}


int main(int argc, char *argv[])
{
	void *pchild_stack = malloc(1024 * 1024);

	int a[] = {1, 2 ,3 ,4};
	if (!pchild_stack) {
		fprintf(stderr, "Unable to allocate stack.\n");
		exit(EXIT_FAILURE);
	}
	
	int pid = clone(child_proc, pchild_stack + (1024 * 1024), SIGCHLD, a);

	if (pid < 0) {
		fprintf(stderr, "Unable to clone.\n");
		free(pchild_stack);
		exit(EXIT_FAILURE);
	}
	
	wait(NULL);

	free(pchild_stack);
	return 0;
}
