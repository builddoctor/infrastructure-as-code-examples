desc "Shut down vagrants so they don't destroy the host machine"
task :kill_all_vagrantses do 

  ['puppet', 'chef'].each do |dir|
    sh "(cd #{dir} && vagrant destroy)"
  end
end
