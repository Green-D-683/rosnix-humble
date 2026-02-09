{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-mirror,
  flexbe-msgs,
  flexbe-onboard,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_widget";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_widget";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ flexbe-core flexbe-mirror flexbe-msgs flexbe-onboard launch-ros rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ flexbe-core flexbe-mirror flexbe-msgs flexbe-onboard launch-ros rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_widget" = substituteSource {
      src = fetchgit {
        name = "flexbe_widget-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "3669168e6e5b012d9e0c3e2fb558cd9e7a67494b";
        hash = "sha256-7o8QRN5UOrStvm1a801//VUjMktrrQZY/jib8wD4gws=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_widget implements some smaller scripts for the behavior engine.\n    ";
  };
})
