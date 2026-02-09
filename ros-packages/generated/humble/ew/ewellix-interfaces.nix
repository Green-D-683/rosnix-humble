{
  ament-cmake,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "ewellix_interfaces";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."ewellix_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_interfaces" = substituteSource {
      src = fetchgit {
        name = "ewellix_interfaces-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "4c449b25efd1b9cab9c6f66d9f4fddfa39dd212f";
        hash = "sha256-oRkcWJPhCZxbkA0gbqSWbIS/p8lYSdoPJMGAMNnVrlc=";
      };
    };
  });
  meta = {
    description = "Ewellix lift ROS 2 driver";
  };
})
