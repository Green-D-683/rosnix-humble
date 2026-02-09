{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_tf2_py";
  version = "0.25.18-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedNativeBuildInputs = [ launch-ros tf2-ros-py ];
  propagatedBuildInputs = [ launch-ros tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "23da379725fd2606917c2d393a25cbefb68d75b3";
        hash = "sha256-R8SfmdMOAlKWtg+LhP0Kz60hS53YXot20ebREgBlLiI=";
      };
    };
  });
  meta = {
    description = "\n    Has examples of using the tf2 Python API.\n  ";
  };
})
