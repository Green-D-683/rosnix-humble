{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-copyright,
  ament-lint-auto,
  ament-pep257,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "adi_imu";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."adi_imu";
  propagatedNativeBuildInputs = [ ament-cmake builtin-interfaces geometry-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libiio-dev" ]; };
  propagatedBuildInputs = [ ament-cmake builtin-interfaces geometry-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libiio-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-xmllint ament-copyright ament-lint-auto ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "adi_imu" = substituteSource {
      src = fetchgit {
        name = "adi_imu-source";
        url = "https://github.com/ros2-gbp/adi_imu-release.git";
        rev = "f49bb9dc83c50a603716ac8ce6a9ba38953830e5";
        hash = "sha256-AkA1qIcqXilSM9Jns1diUSxspbVjxFYeeCmQfhqqND0=";
      };
    };
  });
  meta = {
    description = "Publisher for ADI IMUs";
  };
})
