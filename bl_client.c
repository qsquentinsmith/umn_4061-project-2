/*
Main function for bl_client executable
main function and thread workers
Implement the client which allows a single user to communicate with the server in this file. 
The client must have multiple threads so you will need to implement some worker functions as thread entry points here.
*/

#include "blather.h"

pthread_t user_thread;          // thread managing user input
pthread_t server_thread;        // thread managing server input

client_t client;

int main(int argc, char *argv[]){

    // read name of server and name of user from command line args
    sprintf(client.to_client_fname, "%s", argv[1]); // fifo named after name put after server input
    sprintf(client.to_server_fname, "%s", argv[0]); // fifo named after name put after server input

    // create to-server and to-client FIFOs
    mkfifo(client.to_client_fname, S_IRUSR | S_IWUSR);  //create to-server
    mkfifo(client.to_server_fname, S_IRUSR);    //to-client FIFOs

    // write a join_t request to the server FIFO
    // write(client.to_server_fd, &request, sizeof(join_t));

//start a user thread to read input
    // pthread_create(&user_thread );   //create user thread

//start a server thread to listen to the server
    // pthread_create(&server_thread, NULL)



/* --------Rest of Instructions----------*/
// wait for threads to return
// restore standard terminal output

// user thread{
//   repeat:
//     read input using simpio
//     when a line is ready
//     create a mesg_t with the line and write it to the to-server FIFO
//   until end of input
//   write a DEPARTED mesg_t into to-server
//   cancel the server thread

// server thread{
//   repeat:
//     read a mesg_t from to-client FIFO
//     print appropriate response to terminal with simpio
//   until a SHUTDOWN mesg_t is read
//   cancel the user thread
   

  exit(0);
}