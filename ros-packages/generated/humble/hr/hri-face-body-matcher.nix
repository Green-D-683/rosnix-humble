{
  ament-cmake-auto,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  hri,
  hri-msgs,
  lifecycle-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_face_body_matcher";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."hri_face_body_matcher";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater hri hri-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libblas-dev" "libdlib-dev" "liblapack-dev" "libopencv-dev" "libsqlite3-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater hri hri-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libblas-dev" "libdlib-dev" "liblapack-dev" "libopencv-dev" "libsqlite3-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common hri-msgs lifecycle-msgs rcl-interfaces rclpy rosgraph-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "hri_face_body_matcher" = substituteSource {
      src = fetchgit {
        name = "hri_face_body_matcher-source";
        url = "https://github.com/ros4hri/hri_face_body_matcher-release.git";
        rev = "f858244924d52c65c388027f25c8594c446f5f97";
        hash = "sha256-I8XrOuBevH5gTEzxG59hAn+lJUj8ll5xnffb3ixcIVA=";
      };
    };
  });
  meta = {
    description = "The hri_face_body_matcher package";
  };
})
