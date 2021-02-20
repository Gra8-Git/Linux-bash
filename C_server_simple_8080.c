#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
//#define INADDR_LOOPBACK     0x7f000001
//#define INADDR_ANY      0x00000000

void main(){
        int sock = socket(AF_INET, SOCK_STREAM, 0);
        struct sockaddr_in sock_addr;
        int pid;
        sock_addr.sin_family = AF_INET;
        sock_addr.sin_port = htons(0);
        sock_addr.sin_addr.s_addr = htonl(INADDR_ANY);

        bind(sock,(struct sockaddr *)&sock_addr , sizeof(sock_addr));
        listen(sock,3);
        int scli=sizeof(sock_addr);

int newsock = accept(sock, (struct sockaddr *) &sock_addr, &scli);
while(1){
if(newsock > 0){
pid=fork();
char buffer[256];
read(newsock,buffer,255);
printf(buffer);
}

}}
