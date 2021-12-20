docker build -t voroshilovmax/multy-client:latest -t voroshilovmax/multy-client:$SHA -f ./client/Dockerfile ./client
docker build -t voroshilovmax/multy-server:latest -t voroshilovmax/multy-server:$SHA -f ./server/Dockerfile ./server
docker build -t voroshilovmax/multy-worker:latest -t voroshilovmax/multy-worker:$SHA -f ./worker/Dockerfile ./worker

docker push voroshilovmax/multy-client:latest
docker push voroshilovmax/multy-server:latest
docker push voroshilovmax/multy-worker:latest

docker push voroshilovmax/multy-client:$SHA
docker push voroshilovmax/multy-server:$SHA
docker push voroshilovmax/multy-worker:$SHA

kuberctl apply -f k8s
kuberctl set image deploymers/server-deployment server=voroshilovmax/multy-server:$SHA
kuberctl set image deploymers/client-deployment client=voroshilovmax/multy-client:$SHA
kuberctl set image deploymers/worker-deployment worker=voroshilovmax/multy-worker:$SHA