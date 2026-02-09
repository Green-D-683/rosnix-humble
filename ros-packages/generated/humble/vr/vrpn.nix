{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "vrpn";
  version = "7.35.0-11";
  src = finalAttrs.passthru.sources."vrpn";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "vrpn" = substituteSource {
      src = fetchgit {
        name = "vrpn-source";
        url = "https://github.com/ros2-gbp/vrpn-release.git";
        rev = "ff688a4507797c35a48710be678c06defc5e6629";
        hash = "sha256-gVABNgsOIA99lKIlrcjjsnCvXMYzmJtNB/5AH1Im0Wc=";
      };
    };
  });
  meta = {
    description = "The VRPN is a library and set of servers that interfaces with virtual-reality systems, such as VICON, OptiTrack, and others.";
  };
})
