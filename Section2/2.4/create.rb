
gauth_credential 'mycred' do
  action :serviceaccount
  path ENV['CRED_PATH'] # e.g. '/path/to/my_account.json'
  scopes [
    'https://www.googleapis.com/auth/compute'
  ]
end

gcompute_disk 'instance-test-os-1' do
  action :create
  source_image 'projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts'
  zone 'us-west1-a'
  project ENV['GCP_PROJECT']
  credential 'mycred'
end

gcompute_network 'mynetwork-test' do
  action :create
  project ENV['GCP_PROJECT']
  credential 'mycred'
end

gcompute_address 'instance-test-ip' do
  action :create
  region 'us-west1'
  project ENV['GCP_PROJECT']
  credential 'mycred'
end

gcompute_instance 'instance-test' do
  action :create
  machine_type 'n1-standard-1'
  disks [
    {
      boot: true,
      auto_delete: true,
      source: 'instance-test-os-1'
    }
  ]
  network_interfaces [
    {
      network: 'mynetwork-test',
      access_configs: [
        {
          name: 'External NAT',
          nat_ip: 'instance-test-ip',
          type: 'ONE_TO_ONE_NAT'
        }
      ]
    }
  ]
  zone 'us-west1-a'
  project ENV['GCP_PROJECT']
  credential 'mycred'
end
