{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game-controller-spl-interfaces,
  mkSourceSet,
  r2r-spl-test-interfaces,
  rclpy,
  rosSystemPackages,
  rosidl-parser,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "r2r_spl";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."r2r_spl";
  propagatedNativeBuildInputs = [ game-controller-spl-interfaces rclpy rosidl-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ game-controller-spl-interfaces rclpy rosidl-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 r2r-spl-test-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "r2r_spl" = substituteSource {
      src = fetchgit {
        name = "r2r_spl-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "12ce7358216124da35c6b45b592bc0d58f578b60";
        hash = "sha256-pUKEkfSPujNcwIJ5+ffHjCHn71LoGUKQh0YgGjyKoH0=";
      };
    };
  });
  meta = {
    description = "Robot-to-Robot Communication in RoboCup Standard Platform League";
  };
})
