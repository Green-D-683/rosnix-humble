{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "iceoryx_hoofs";
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."iceoryx_hoofs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "acl" "libatomic" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "acl" "libatomic" ]; };
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_hoofs" = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "a0edde7d68649631be7d42b81ec9ddbabf2c011a";
        hash = "sha256-C57YmMV/QQbRaySst8JrcobpnMXYdJ0EFLLY/Zi72ak=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
})
