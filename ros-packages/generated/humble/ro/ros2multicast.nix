{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2multicast";
  version = "0.18.16-1";
  src = finalAttrs.passthru.sources."ros2multicast";
  propagatedNativeBuildInputs = [ ros2cli ];
  propagatedBuildInputs = [ ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2multicast" = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "02b4a6ec0c20440d7027a21103521180dcb1dfc6";
        hash = "sha256-FxGEB/Ys5lyU1Xd8/JDYYdK0y85JDCwPMGcD3RUj+7k=";
      };
    };
  });
  meta = {
    description = "\n    The multicast command for ROS 2 command line tools.\n  ";
  };
})
