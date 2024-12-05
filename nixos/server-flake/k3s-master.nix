{config, pkgs, ...}:

{

services.k3s = {
    enable = true;
    serverAddr = "https://127.0.0.1:6443"; #point this to server/master node
    role = "server";
    disableAgent = true;
    #tokenFile = ""; #only for agent/worker node
    #selinux = "true"; #for security hardening    
    clusterInit = true;
    configPath = "/etc/rancher/k3s/k3s.yaml";
    extraFlags = toString [

      "--write-kubeconfig-mode \"0644\""
	    "--cluster-init"
	    "--disable servicelb"
	    "--disable traefik"
	    "--disable local-storage"

    ];
};
  
}
