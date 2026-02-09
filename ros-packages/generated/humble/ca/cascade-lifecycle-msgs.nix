{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cascade_lifecycle_msgs";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."cascade_lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces lifecycle-msgs rclcpp rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rclcpp rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "cascade_lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "cascade_lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "030879a4241d6dedcbcca3b181ddff67daf8da3d";
        hash = "sha256-zmOY/vNG6SpKHkTAIAHTB1jxV4PwvGd7A9WoIhvIX1Y=";
      };
    };
  });
  meta = {
    description = "Messages for rclcpp_cascade_lifecycle package";
  };
})
