Ubuntu LXC Deloy helper
========================

This is a automatic helper for more confortable use of ubuntu lxc function.
It automatic extract the lxc rootfs template, and change some config files so that you can deploy the lxc environment in just one command!


## Usage

First of all you should make your own rootfs on ubuntu, typically, we can create a lxc like this:

lxc-create -t ubuntu -n <lxc-name>

and then this file will appear in the /var/lib/lxc directory, start it, and configure the template.

After you have finished this process, just tar -cpf ubuntu-template.tar.gz ./lxc-name/*, to get the rootfs and config archive.

then when you want to deploy the template, just use:

deploy.sh <lxc-name> <bridge-name> <ip-address> <gw-address>

It's simple and easy but can save a lot of redundant time in deploy test environments!