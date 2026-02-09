{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "create3_examples_py";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_examples_py";
  propagatedNativeBuildInputs = [ geometry-msgs irobot-create-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "create3_examples_py" = substituteSource {
      src = fetchgit {
        name = "create3_examples_py-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "38bbfa17b3927b678da411c1420c0da56065d9b7";
        hash = "sha256-AqZNTwZugSdPoEG0ovRww8W7EE7Wg+NfukJlVl5h9VA=";
      };
    };
  });
  meta = {
    description = "Python examples for interacting with the iRobot(R) Create(R) 3 Educational Robot";
  };
})
