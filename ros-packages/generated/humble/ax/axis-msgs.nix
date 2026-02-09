{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "axis_msgs";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."axis_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "axis_msgs" = substituteSource {
      src = fetchgit {
        name = "axis_msgs-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "5320049c9090f39434655a82c5e8977d00663e26";
        hash = "sha256-hjSHd4Q6kUJKfA1BNyzwggx0l09gNuQMxI1Lu2ngMbU=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages used by the axis_camera package to control Axis PTZ and fixed cameras\n  ";
  };
})
