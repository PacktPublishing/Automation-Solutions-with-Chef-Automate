require_controls 'apache-baseline' do
  control 'apache-01'
  control 'apache-04'
  control 'apache-05'
  control 'apache-06'

  control 'apache-14' do
    impact 0.3
  end
end

