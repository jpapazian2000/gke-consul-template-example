Consul and consul-template in kubernetes to configure nginx load balancer

Testing automatic configuration of NGINX load balancer in GKE
with consul-template

We deploy consul in GKE k8s cluster using Helm and deploy a 3 instance webapp 
We use a NGINX LB to load balance this app
This load balancer is automatically configured by consul-template

Set .env file with your own variables
Note :If you create your own docker image for nginx_lb with consul-template update the nginx_lb_with_consul_template.yaml with your image name
Steps:
0. Create your own NGINX image with consul-template or just use my image "kaparora/nginx_consul_template:latest"
1. Deploy GKE Cluster
2. Install Consul with Helm
3. Install a webapp with consul inject true
4. Deploy NGINX load balancer (including consul-template) 
5. Open the nginx-lb External IP in a browser to see the load balancer in action (Automatic initial configuration)
6. Scale webapp and check the nginx External IP in the browser again (Automatic configuration update)
7. Destroy GKE cluster
