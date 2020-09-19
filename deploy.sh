docker build -t staskosatkin/multi-client:latest -t staskosatkin/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t staskosatkin/multi-server:latest -t staskosatkin/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t staskosatkin/multi-worker:latest -t staskosatkin/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push staskosatkin/multi-client:latest
docker push staskosatkin/multi-server:latest
docker push staskosatkin/multi-worker:latest

docker push staskosatkin/multi-client:$SHA
docker push staskosatkin/multi-server:$SHA
docker push staskosatkin/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=staskosatkin/multi-client:$SHA
kubectl set image deployments/server-deployment server=staskosatkin/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=staskosatkin/multi-worker:$SHA
