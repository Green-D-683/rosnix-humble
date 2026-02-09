{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map,
  grid-map-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "namosim";
  version = "0.0.4-2";
  src = finalAttrs.passthru.sources."namosim";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs grid-map grid-map-msgs rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "black" "jupyter-notebook" "libcairo2-dev" "libopencv-dev" "python3-bidict" "python3-cairosvg" "python3-jsonpickle" "python3-matplotlib" "python3-numpy" "python3-opencv" "python3-pandas" "python3-pil" "python3-pre-commit" "python3-pydantic" "python3-pytest" "python3-pytest-cov" "python3-requests" "python3-shapely" "python3-skimage" "python3-tk" "python3-typer" "python3-typing-extensions" ]; };
  propagatedBuildInputs = [ geometry-msgs grid-map grid-map-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "black" "jupyter-notebook" "libcairo2-dev" "libopencv-dev" "python3-bidict" "python3-cairosvg" "python3-jsonpickle" "python3-matplotlib" "python3-numpy" "python3-opencv" "python3-pandas" "python3-pil" "python3-pre-commit" "python3-pydantic" "python3-pytest" "python3-pytest-cov" "python3-requests" "python3-shapely" "python3-skimage" "python3-tk" "python3-typer" "python3-typing-extensions" ]; };
  passthru.sources = mkSourceSet (sources: {
    "namosim" = substituteSource {
      src = fetchgit {
        name = "namosim-source";
        url = "https://github.com/ros2-gbp/namosim-release.git";
        rev = "41e6c5d0edd4064c3a145d95c15061d754c31aae";
        hash = "sha256-4fkgwuTeonRqZs/IBKMX02HE722W3Gzmxpkn4DX6EM4=";
      };
    };
  });
  meta = {
    description = "A navigation planner for Navigation Among Movable Obstacles (NAMO)";
  };
})
