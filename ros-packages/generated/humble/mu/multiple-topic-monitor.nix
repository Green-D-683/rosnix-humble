{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "multiple_topic_monitor";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."multiple_topic_monitor";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "multiple_topic_monitor" = substituteSource {
      src = fetchgit {
        name = "multiple_topic_monitor-source";
        url = "https://github.com/ros2-gbp/multiple_topic_monitor-release.git";
        rev = "1509e606e62b235979e45761f84589216d2ed604";
        hash = "sha256-Zv86qF0YjIbcdTqvk8N3/LkRnZu2iMlKFJ8ATRfVZQ0=";
      };
    };
  });
  meta = {
    description = "ROS 2 package for monitoring the frequency and delay of multiple topics.";
  };
})
