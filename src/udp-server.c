#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>

int main(void) {

    int udp_server = socket(AF_INET, SOCK_DGRAM, 0);
    if(udp_server < 0) {
        perror("Socket creation failed");
        return 0;
    }
    printf("socket initiated\n");

    /* The fucking object that only holds configs */
    struct sockaddr_in server_addr, client_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(5000);
    server_addr.sin_addr.s_addr = htons(INADDR_ANY);

    if (bind(udp_server, (struct sockaddr *)&server_addr, 16) < 0) {
        perror("bind failed");
        return 0;
    }
    printf("bind successfull\n");

    /* Now we listen */
    unsigned char buffer[2048];
    pid_t pid;

    while(1) {
        printf("waiting on port %d\n", 5000);

        int client_len = sizeof(client_addr);

        int recv_len = recvfrom(udp_server, buffer, 2048, 0, (struct sockaddr *)&client_addr, &client_len);

        if(recv_len == -1) {
            perror("receive failed");
            return 0;
        }

        printf("received %d bytes\n", recv_len);
        if (recv_len > 0) {
            buffer[recv_len] = 0;
            printf("received message: %s\n", buffer);

            printf("loging it to file\n");
        }
    }
    close(udp_server);
    printf("end of program\n");
}
