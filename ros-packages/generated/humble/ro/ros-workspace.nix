{
  ament-cmake-core,
  ament-package,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ros_workspace";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."ros_workspace";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-package ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-package ];
  passthru.sources = mkSourceSet (sources: {
    "ros_workspace" = substituteSource {
      src = fetchgit {
        name = "ros_workspace-source";
        url = "https://github.com/ros2-gbp/ros_workspace-release.git";
        rev = "8fd20fe34b5a5cbbf636bbdf3f62efcae053166d";
        hash = "sha256-FXiyjTZx5N94wlqTFY6bxysv+eiH6noKxFlYXOwcV2M=";
      };
    };
  });
  meta = {
    description = "\n    Provides the prefix level environment files for ROS 2 packages.\n  ";
  };
})
