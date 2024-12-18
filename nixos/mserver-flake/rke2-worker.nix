{config, pkgs, ...}:

{
services.rke2 = {
    enable = true;
    serverAddr = "https://127.0.0.1:6443"; #point this to server/master node
    #cni = "cilium"; #only for server/master node
    role = "agent";
    tokenFile = ""; #only for agent/worker node
    #selinux = "true"; #for security hardening    
    nodeName = "rke2-worker1";
    nodeIP = "";
    configPath = "/etc/rancher/rke2/config.yaml";
};
  
}
