describe docker.containers do
  its('images') { should_not include 'u12:latest' }
end

# returns all running container ids
docker.containers.running?.ids.each do |id|
  # call docker inspect to retrieve detailed information about the container
  describe docker.object(id) do
    its('HostConfig.Privileged') { should cmp false }
  end
end


