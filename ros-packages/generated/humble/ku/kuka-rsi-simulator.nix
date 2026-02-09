{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2launch,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "kuka_rsi_simulator";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_rsi_simulator";
  propagatedNativeBuildInputs = [ ros2launch ];
  propagatedBuildInputs = [ ros2launch ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_rsi_simulator" = substituteSource {
      src = fetchgit {
        name = "kuka_rsi_simulator-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "64d245c5a7a1ad4d508032287b9f1e02299ef535";
        hash = "sha256-vfQro3QC4lej2k6ueIs3urLCizoVdvzWYwb4giGjGjI=";
      };
    };
  });
  meta = {
    description = "Simple package for simulating the KUKA RSI interface";
  };
})
