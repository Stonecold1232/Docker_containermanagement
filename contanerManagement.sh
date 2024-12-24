echo "Welcome To Container Management Tool"
echo "you can [see, pull, run, stop] images in this program" 
echo "here you go echo "
echo "**************"
show_images()
{ 
	echo "Available images as per docker in your sysytem:" 
	echo "*******"
	docker images | awk '(print $1 $2 )' 
pull_image(){ 
	echo "enter the name of image you want to pull:" 
	read image name 
	echo "enter the version or tag of the image you choosed" 
	read version 
	if [ -z "$version" ]; 
	then 
		version="latest"
	fi 
	docker pull "$image name: $version"
runimage(){ 
	echo "enter the image name to run" 
	read image_name 
	echo "enter the version or tag of the image and leave empty for latest tag" 
	read version 
	if [ -z "$version" ]; 
	then 
	version="Latest" 
	fi
	echo "enter the name of conatainer you want to give" 
	read container name 
	if [ -z "$container_name"]; 
	then 
	docker run -d "$image_name: $version"
	else 
	docker run -d-name "$container_name" "$image_name: $version"  
	fi 
	echo "container is now running at this moment" 
	docker ps-filter "ancestor-$image_name:$version"

stop_container(){ 
	echo "enter the name of container or ID to stop that container" 
	read container_name 
	docker stop "$container_name" 
	echo "container stopped"
view_running_containers(){
       	echo "currently runnning docker containers are:"
       	docker ps 
echo "*************"
while true; do 
	echo """
	Press 1: See available images 
	Press 2: Pull an image 
	Press 3: Run an image 
	Press 4: Exit 
	"""
	read -p "Enter your choice: "choice 
	case $choice in 
		1) 
			show_images 
			;;
		2) 
			pull_image 
			;;
		3)
			run image 
			;;
		4)
		       	view_running_containers
			;;
		5) 
			echo "Exiting the Docker Management Tool." 
			break 
			;;
		*)
			echo "Invalid choice, please try again."
                        ;;
	esac
 done
			
			

