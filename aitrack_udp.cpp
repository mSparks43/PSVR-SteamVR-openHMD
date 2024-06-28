#include "aitrack_udp.h"

AIUDP::AIUDP(void)
{
    inited=false;
    run=true;
    hadData=false;
}
AIUDP::~AIUDP(void){
    run=false;
    if(inited)    
        close(sockfd);
    if(some_threads[0].joinable())
		some_threads[0].join();
    
}
void AIUDP::init(void){
    printf("setup listening for AITRACK\n");
    if(inited)
        return;
    printf("create socket for AITRACK\n");    
    if ( (sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0 ) {
        printf("socket creation failed\n");
        run=false;
        return;
    }
    memset(&servaddr, 0, sizeof(servaddr));
       
    // Filling server information
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(4242);
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
       
    int n;
     printf("bind socket for AITRACK\n"); 
    if ( bind(sockfd, (const struct sockaddr *)&servaddr, 
            sizeof(servaddr)) < 0 )
    {
        printf("bind failed\n");
        run=false;
        return;
    }
    inited=true;
    printf("listening for AITRACK\n");
    some_threads.push_back(std::thread(&AIUDP::start, this));
}
void AIUDP::finish(void){
    
}
void AIUDP::start(void){
    int n;
    printf("start listening for AITRACK\n");
    while(run){  
        try{
       // printf("doing listening for AITRACK\n");    
        n = recvfrom(sockfd, (double *)buffer, MAXLINE, 
                    MSG_WAITALL, (struct sockaddr *) &servaddr,
                    &len);
        //buffer[n] = '\0';

        //std::cout<<"Server :"<<buffer<<std::endl;
        //printf("recieved %f %f %f\n",buffer[0],buffer[1],buffer[2]);
        data_mutex.lock();
        xyz[0]=buffer[0];
        xyz[1]=buffer[1];
        xyz[2]=buffer[2];
        if(!hadData){
            hadData=true;
            refxyz[0]=buffer[0];
            refxyz[1]=buffer[1];
            refxyz[2]=buffer[2];
        }
        data_mutex.unlock();
        }catch(const std::exception& ex){

        }
    }
}

std::vector<double> AIUDP::getPose(void){
    std::vector<double> retVal={0,0,0};
    data_mutex.lock();
    retVal[0]=-(xyz[0]-refxyz[0])/90.0;
    retVal[1]=(xyz[1]-refxyz[1])/140.0+1.3;
    retVal[2]=-(xyz[2]-refxyz[2])/140.0;
    data_mutex.unlock();
    return retVal;
}