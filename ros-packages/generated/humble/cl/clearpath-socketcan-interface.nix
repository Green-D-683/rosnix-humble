{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_socketcan_interface";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."clearpath_socketcan_interface";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libconsole-bridge-dev" "linux-kernel-headers" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libconsole-bridge-dev" "linux-kernel-headers" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_socketcan_interface" = substituteSource {
      src = fetchgit {
        name = "clearpath_socketcan_interface-source";
        url = "https://github.com/clearpath-gbp/puma_motor_driver-release.git";
        rev = "b7da478beb861fed1e2e420fb257c93ac25bb844";
        hash = "sha256-sZQk80Eii5MCCZ02MklTDcPmtwE+dwES6R4N74dPRLE=";
      };
    };
  });
  meta = {
    description = "Clearpath's CAN interface description with helpers for filtering and driver implementation. Further a socketcan implementation based on boost::asio is included.";
  };
})
