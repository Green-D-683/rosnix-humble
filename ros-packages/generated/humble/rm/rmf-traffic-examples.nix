{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-traffic,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_traffic_examples";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic_examples";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ rmf-traffic ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-traffic ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_examples" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_examples-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "88002ef85dca14d6ff478e0320a08fe246dcbae0";
        hash = "sha256-DsNxMOpw3K1vh/fzWtVMgQK3Y+5GQgWzZR2E5FqIBA0=";
      };
    };
  });
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
})
