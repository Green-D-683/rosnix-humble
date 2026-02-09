{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  axis-msgs,
  buildAmentPythonPackage,
  camera-info-manager-py,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ptz-action-server-msgs,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "axis_camera";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."axis_camera";
  propagatedNativeBuildInputs = [ axis-msgs camera-info-manager-py ptz-action-server-msgs sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-requests" ]; };
  propagatedBuildInputs = [ axis-msgs camera-info-manager-py ptz-action-server-msgs sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "axis_camera" = substituteSource {
      src = fetchgit {
        name = "axis_camera-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "be529969bc98da30f57134b64228a0a6d632b21b";
        hash = "sha256-dvaE9IlkQKr82aWpp8sTCGMTtwzqmGXMBqiu3QHjSQc=";
      };
    };
  });
  meta = {
    description = "ROS 2 driver for fixed and PTZ Axis cameras";
  };
})
