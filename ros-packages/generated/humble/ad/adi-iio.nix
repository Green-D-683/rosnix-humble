{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-xmllint,
  ament-copyright,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-pytest,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclpy,
  ros2launch,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-typesupport-introspection-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "adi_iio";
  version = "1.0.1-3";
  src = finalAttrs.passthru.sources."adi_iio";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rclcpp ros2launch rosidl-default-runtime rosidl-typesupport-introspection-cpp std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libiio-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rclcpp ros2launch rosidl-default-runtime rosidl-typesupport-introspection-cpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libiio-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-ros ament-cmake-xmllint ament-copyright ament-lint-auto ament-lint-common ament-pep257 launch launch-pytest launch-ros launch-testing launch-testing-ament-cmake rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "adi_iio" = substituteSource {
      src = fetchgit {
        name = "adi_iio-source";
        url = "https://github.com/ros2-gbp/adi_iio-release.git";
        rev = "e23aa1192f7333106e6c49ededa203db9045f451";
        hash = "sha256-hSnQMLGeJAODVu50SaaXPs3WCMkz5oic/HKAl3hJPq4=";
      };
    };
  });
  meta = {
    description = " ROS package to interface with IIO devices ";
  };
})
