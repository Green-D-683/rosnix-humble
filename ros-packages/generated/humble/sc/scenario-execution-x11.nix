{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  scenario-execution,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_x11";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."scenario_execution_x11";
  propagatedNativeBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_x11" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_x11-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "a1fe8c520f4e9e3e0ccc1c5c8f896ec6f47986c0";
        hash = "sha256-0mfaHzBK0uJhe/roxrY6H3jr2gcfXAMHYFTuv/H7Mb4=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for X11";
  };
})
