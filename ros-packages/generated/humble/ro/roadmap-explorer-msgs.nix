{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "roadmap_explorer_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."roadmap_explorer_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ros-environment rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ros-environment rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "roadmap_explorer_msgs" = substituteSource {
      src = fetchgit {
        name = "roadmap_explorer_msgs-source";
        url = "https://github.com/ros2-gbp/roadmap_explorer-release.git";
        rev = "554818149970e2c338bac43ddf4c457ba9388661";
        hash = "sha256-7X+y6e67ffFgbjYsEwHtiEY89BbkYhBQJgJweM9TwwI=";
      };
    };
  });
  meta = {
    description = "A package that has the ROS 2 interfaces for running roadmap-explorer";
  };
})
