name: Bug Report
description: Create a report to help us improve SecureMail
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: Thanks for taking the time to fill out this bug report!
  - type: input
    id: version
    attributes:
      label: SecureMail Version
      placeholder: e.g. v2.0.0
    validations:
      required: true
  - type: textarea
    id: description
    attributes:
      label: Describe the Bug
      description: A clear and concise description of what the bug is.
    validations:
      required: true
  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: Steps to reproduce the behavior.
      placeholder: |
        1. Go to '...'
        2. Click on '....'
        3. See error
    validations:
      required: true
  - type: textarea
    id: environment
    attributes:
      label: Environment Info
      description: OS, Docker version, Architecture (AMD64 / ARM64), Browser.
