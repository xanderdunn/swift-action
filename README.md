# Swift for Tensorflow Docker Action

This action builds, tests, and runs swift-lint on a Swift package.

## Development
- `sudo apt install docker.io`
- `sudo docker build .`

## Usage

Add this to your .yml configuration under steps:
```yaml
    - uses: actions/checkout@v2 # Get the code
    - uses: xanderdunn/swift-action@v1.4 # Run build and test
    - name: GitHub Action for SwiftLint # Optional to run swift-lint
      uses: norio-nomura/action-swiftlint@3.1.0
```
