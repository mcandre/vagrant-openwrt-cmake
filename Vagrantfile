Vagrant.configure("2") do |config|
  config.vm.box = "mcandre/vagrant-openwrt-make"
  config.vm.box_version = "0.0.1"

  # Prepare for vagrant package
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", type: "rsync", disabled: true

  config.vm.provision "file", source: "bootstrap.patch", destination: "/tmp/bootstrap.patch"
  config.vm.provision "file", source: "SystemInformation.cxx.patch", destination: "/tmp/SystemInformation.cxx.patch"
  config.vm.provision "file", source: "json_reader.cpp.patch", destination: "/tmp/json_reader.cpp.patch"
  config.vm.provision "file", source: "json_writer.cpp.patch", destination: "/tmp/json_writer.cpp.patch"
  config.vm.provision "file", source: "cmQtAutoGenerator.cxx.patch", destination: "/tmp/cmQtAutoGenerator.cxx.patch"
  config.vm.provision "file", source: "cmQtAutoGenInitializer.cxx.patch", destination: "/tmp/cmQtAutoGenInitializer.cxx.patch"
  config.vm.provision "file", source: "cmCTest.cxx.patch", destination: "/tmp/cmCTest.cxx.patch"
  config.vm.provision "file", source: "cmCTestScriptHandler.cxx.patch", destination: "/tmp/cmCTestScriptHandler.cxx.patch"
  config.vm.provision "file", source: "cmProcess.cxx.patch", destination: "/tmp/cmProcess.cxx.patch"
  config.vm.provision "file", source: "GNU-C.cmake.patch", destination: "/tmp/GNU-C.cmake.patch"
  config.vm.provision "file", source: "GNU-CXX.cmake.patch", destination: "/tmp/GNU-CXX.cmake.patch"
  config.vm.provision "file", source: "cmlibuv-CMakeLists.txt.patch", destination: "/tmp/cmlibuv-CMakeLists.txt.patch"

  config.vm.provision "shell", path: "bootstrap.sh"
end
