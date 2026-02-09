{
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-param-builder,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  srdfdom,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "moveit_configs_utils";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_configs_utils";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  propagatedBuildInputs = [ ament-index-python launch launch-param-builder launch-ros srdfdom ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_configs_utils" = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d2fc637b9b26047678cb90324accf4bc7819ab66";
        hash = "sha256-4Zip5aB2KxzKdDgt5LH2rXa32XZm5Lq9wTqCUW+w2Fw=";
      };
    };
  });
  meta = {
    description = "Python library for loading moveit config parameters in launch files";
  };
})
