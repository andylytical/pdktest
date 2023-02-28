test:
	bash go.sh

clean:
	docker container prune -f
	docker images | awk '/pdk/ {print $$3}' | xargs -r docker rmi
	docker system prune -f
