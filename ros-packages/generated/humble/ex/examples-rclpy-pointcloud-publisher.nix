{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_pointcloud_publisher";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs sensor-msgs-py std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ rclpy sensor-msgs sensor-msgs-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_pointcloud_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "bcc33adbef63209398b21bc62a5ea9789e2efbba";
        hash = "sha256-HNhVCo+Y367Iq8Bo0XmxomvoQiSp0Lokn8EJNvgrxmE=";
      };
    };
  });
  meta = {
    description = "Example on how to publish a Pointcloud2 message";
  };
})
