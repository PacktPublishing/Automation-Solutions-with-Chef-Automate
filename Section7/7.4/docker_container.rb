describe docker_container('container_postgres') do
  it { should exist }
  it { should be_running }
  its('repo') { should eq 'postgres' }
  its('ports') { should eq "0.0.0.0:5432->5432/tcp" }
  its('command') { should eq 'docker-entrypoint.sh postgres' }
end

