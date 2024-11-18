{config, pkgs, ...}:

{

services.k3s = {
    enable = true;
    serverAddr = "https://192.168.0.45:6443"; #point this to server/master node
    role = "agent";
    #tokenFile = ""; #only for agent/worker node
    #selinux = "true"; #for security hardening    
    configPath = "/etc/rancher/k3s/k3s.yaml";
    extraFlags = toString [

        "--write-kubeconfig-mode 644"

    ];
};
  
}
