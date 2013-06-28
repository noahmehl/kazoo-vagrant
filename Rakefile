task :install_cookbooks do
    system "mkdir cookbooks"
    system "berks install --path cookbooks/"
end

task :clean do
  system "rm -r .kitchen"
  system "rm -r cookbooks"
end
