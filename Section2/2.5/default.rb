
docker_service 'default' do
	action [:create, :start]
end

#Pull latest nginx image
docker_image 'nginx' do
	tag 'latest'
	action :pull
end

#Run container mapping container port 80 to host port 80
docker_container 'chef_nginx' do
	repo 'nginx'
	tag 'latest'
	port '80:80'
end

#Copy Dockerfile for build
cookbook_file '/tmp/Dockerfile' do
	source 'Dockerfile'
	action :create
end

#Build image
docker_image 'mamtaj/wordpress' do
	tag 'v1'
	source '/tmp/Dockerfile'
	action :build
end

docker_image 'mamtaj/wordpress' do
  action :push
end


#Run container mapping container port 80 to host port 80
docker_container 'my_wordpress' do
	repo 'mamtaj/wordpress'
	tag 'latest'
	port '81:80'
end
