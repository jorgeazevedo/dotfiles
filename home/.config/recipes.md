## ssh tunnel: reach a remote port at localhost:8080
ssh -N -L 8080:localhost:80 user@host

## docker: throwaway ubuntu shell
docker run --rm -it ubuntu bash
