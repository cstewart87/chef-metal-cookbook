#
# Cookbook Name:: chef_metal
# Recipe:: key_pair
#
# Copyright (C) 2014 Curtis Stewart
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef_metal::default'

directory node['chef_metal']['key_dir']

fog_key_pair node['chef_metal']['key_pair'] do
  private_key_path "#{node['chef_metal']['key_dir']}/#{node['chef_metal']['key_pair']}"
  public_key_path "#{node['chef_metal']['key_dir']}/#{node['chef_metal']['key_pair']}.pub"
end
