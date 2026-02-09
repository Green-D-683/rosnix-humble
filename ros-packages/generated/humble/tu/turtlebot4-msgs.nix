{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_msgs";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot4_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "ee3d93df10b42b1ffe0e14b36a91b33120a12195";
        hash = "sha256-Y5yPAwQhineKSpwufYHXJAECt/MNKqve7LgDrg9kqOU=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Messages";
  };
})
