include_recipe 'chef_metal_test'

with_fog_provisioner(
  :provider => 'OpenStack',
  :openstack_api_key => node['chef_metal']['openstack_api_key'],
  :openstack_username => node['chef_metal']['openstack_username'],
  :openstack_auth_url => node['chef_metal']['openstack_auth_url'],
  :openstack_tenant => node['chef_metal']['openstack_tenant'],
  :base_bootstrap_options => {
    :flavor_ref => node['chef_metal']['openstack_flavor_ref'],
    :image_ref => node['chef_metal']['openstack_image_ref'],
    :floating_ip => node['chef_metal']['openstack_floating_ip'],
    :security_groups => node['chef_metal']['openstack_security_groups']
  }
)

with_provisioner_options :flavor_ref => node['chef_metal']['openstack_flavor_ref']

machine 'chef_test' do
  recipe 'apt'
end
