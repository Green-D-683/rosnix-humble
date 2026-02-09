{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2ai";
  version = "0.1.3-5";
  src = finalAttrs.passthru.sources."ros2ai";
  propagatedNativeBuildInputs = [ ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "python3-openai-pip" "python3-validators" ]; };
  propagatedBuildInputs = [ ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" "python3-openai-pip" "python3-validators" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint geometry-msgs launch launch-ros launch-testing launch-testing-ros std-msgs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2ai" = substituteSource {
      src = fetchgit {
        name = "ros2ai-source";
        url = "https://github.com/ros2-gbp/ros2ai-release.git";
        rev = "cb99bc9accca24c55f6e9a42317ae789c0099349";
        hash = "sha256-mU429bR8mggVV2jZmzYOOXofZSttI6m7bvwfBTZ6FCQ=";
      };
    };
  });
  meta = {
    description = "\n    The OpenAI command for ROS 2 command line tools.\n  ";
  };
})
