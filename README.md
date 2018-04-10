# vagrant-openwrt-cmake: a Vagrant box with uClibC/Linux (OpenWrt) + cmake

# ERROR

Unfortunately, compilation is currently broken due to conflicts with OpenWrt Chaos Calmer's gcc support for pthreads.

# VAGRANT CLOUD

https://app.vagrantup.com/mcandre/boxes/vagrant-openwrt-cmake

# EXAMPLE

```console
$ cd test
$ vagrant up
$ vagrant ssh -c "cd /vagrant && cmake . && cmake --build . --config Release"
...
```

# RUNTIME REQUIREMENTS

* [Vagrant](https://www.vagrantup.com)
* The [VirtualBox](https://www.virtualbox.org) hypervisor provider

## Recommended

* [vagrant-rsync-back](https://github.com/smerrill/vagrant-rsync-back) assists in copying artifacts from the guest to the host

# BUILDTIME REQUIREMENTS

* [Vagrant](https://www.vagrantup.com)
* The [VirtualBox](https://www.virtualbox.org) hypervisor provider
* [make](https://www.gnu.org/software/make/)

# EXPORT

```console
$ make vagrant-openwrt-cmake.box
```