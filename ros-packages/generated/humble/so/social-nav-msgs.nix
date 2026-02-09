{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "social_nav_msgs";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."social_nav_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-2d-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-2d-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "social_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "social_nav_msgs-source";
        url = "https://github.com/ros2-gbp/social_nav_ros-release.git";
        rev = "2f1f313f2eff65f498fb53843122672fffb12d76";
        hash = "sha256-UgjecuJTo078mKAyGtgqCQ3sIczwiZBlVuiS/7MvYLg=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for social navigation";
  };
})
