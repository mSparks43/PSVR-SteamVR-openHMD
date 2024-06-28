#ifndef AIUDP_H
#define AIUDP_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <mutex>
#include <thread>
#include <vector>
#define PORT     4242
#define MAXLINE 1024
class AIUDP
{
private:
    double xyz[3]={0,0,0};
    double refxyz[3]={0,0,0};
    int sockfd;
    double buffer[MAXLINE];
    socklen_t len;
    struct sockaddr_in servaddr;
    bool run;
    bool hadData;
    bool inited;
    std::mutex data_mutex;
    std::vector<std::thread> some_threads;
public:
    AIUDP();
    ~AIUDP();
    void init();
    void finish();
    void start();
    std::vector<double> getPose();
}; 
#endif // AIUDP_H