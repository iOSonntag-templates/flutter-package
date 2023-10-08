module.exports = {
  "branches": [
    "main",
    "master"
  ],
  "plugins": [
    [
      "@semantic-release/commit-analyzer",
      {
        "preset": "angular",
        "releaseRules": [
          {
            "type": "breaking",
            "release": "major"
          }
        ]
      }
    ],
    [
      "@semantic-release/exec",
      {
        "verifyReleaseCmd": "echo \"NEXT_RELEASE_VERSION=${nextRelease.version}\" >> $GITHUB_OUTPUT"
      }
    ],
    "@semantic-release/release-notes-generator",
    [
      "@semantic-release/changelog",
      {
        "changelogFile": "CHANGELOG.md"
      }
    ]
  ],
  "dryRun": false,
  "preset": "angular"
};