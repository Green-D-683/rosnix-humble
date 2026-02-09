{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  turtlebot4-navigation,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot4_python_tutorials";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_python_tutorials";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ irobot-create-msgs rclpy turtlebot4-navigation ];
  propagatedBuildInputs = [ irobot-create-msgs rclpy turtlebot4-navigation ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_python_tutorials" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_python_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "53ea006c711b24fc901f1513cb571afe6d012694";
        hash = "sha256-7D8580yyux7ctWXrIayIBor+du4XC0d3x1G7swBq1MA=";
      };
    };
  });
  meta = {
    description = "TurtleBot 4 Python Tutorials";
  };
})
