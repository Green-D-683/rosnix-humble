{
  buildAmentPythonPackage,
  compressed-image-transport,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_yolo_object_detection";
  version = "1.3.3-2";
  src = finalAttrs.passthru.sources."turtlebot3_yolo_object_detection";
  propagatedNativeBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_yolo_object_detection" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_yolo_object_detection-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "10417ceb84ed2bc3d5cc9f42773fba8377243364";
        hash = "sha256-LyLcXx3HdRs6q9ocvbhqo1URQGUMHCKQcJJmQYmEFlY=";
      };
    };
  });
  meta = {
    description = "\n    YOLO-based object detection for TurtleBot3\n  ";
  };
})
