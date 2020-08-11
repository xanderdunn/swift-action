# Swift for Tensorflow Docker Action

This action builds, tests, and runs swift-lint on a Swift package.

## Development
- `sudo apt install docker.io`
- `sudo docker build .`

## Usage

```yaml
- uses: xanderdunn/swift-action
- name: Build
  run: swift build -v
- name: Test
  run: swift test -v
```
