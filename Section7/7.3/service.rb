control 'apache-service-check' do
  title 'Ensure the Apache Service is configured and running'
  desc 'Ensure the Apache Service is configured correctly and setup correctly'
  describe service('apache') do
    it { should be_enabled }
    it { should be_running }
    it { should be_installed }
  end
end

