echo "Welcome To Container Management Tool"
echo "you can [see, pull, run, stop] images in this program" 
echo "here you go echo "
echo "**************"
show_images()
{ 
	echo "Available images as per docker in your sysytem:" 
	echo "*******"
	docker images
}	
pull_image()
{ 
	echo "enter the name of image you want to pull:" 
	read imagename 
	docker pull $imagename
}
run_container(){ 
	echo "enter the container name to run"
       	read container
	docker start "$container" &&echo "Container $container started successfully!" || echo "Failed to start container $container. " 
}
stop_container(){ 
	echo "enter the name of container or ID to stop that container" 
	read container_name 
	docker stop "$container_name" 
	echo "container stopped"
}	
view_running_containers(){
       	echo "currently runnning docker containers are:"
	docker ps 
	echo "*************"
}
while :; do 
	echo """
	Press 1: See available images 
	Press 2: Pull an image 
	Press 3: Run a container 
	Press 4: View running Containers
	Press 5: Stop Running Container
        Press 6: Exit	
	"""
	read -p "Enter your choice: " choice 
	case $choice in 
		1) 
			show_images 
			;;
		2) 
			pull_image 
			;;
		3)
			run_container 
			;;
		4)
		       	view_running_containers
			;;
		5)
			stop_container
			;;
		6) 
			echo "Exiting the Docker Management Tool." 
			break 
			;;
		*)
			echo "Invalid choice, please try again."
			;;
	esac
done

