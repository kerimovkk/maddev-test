# SetUserAgent Demo Application

Demo application showcasing custom user agent functionality for webview library.

## Overview

This application demonstrates the implementation of `SetUserAgent` method for the webview library, allowing custom user agent strings to be set for webview instances.

## Implementation Repositories

- **C++ Core:** [kerimovkk/webview](https://github.com/kerimovkk/webview)
- **Go Bindings:** [kerimovkk/webview_go](https://github.com/kerimovkk/webview_go) (v0.1.0)

## Prerequisites

### System Dependencies

```bash
sudo apt-get update
sudo apt-get install -y libwebkit2gtk-4.1-dev libgtk-3-dev build-essential pkg-config
```

## Build and Run

```bash
# Clone the repository
git clone https://github.com/kerimovkk/maddev-test.git
cd maddev-test

# Build (installs dependencies and compiles)
./build.sh

# Run
./main
```

### Manual Build

If you prefer to build manually:

```bash
# Install dependencies
sudo apt-get install -y libwebkit2gtk-4.1-dev libgtk-3-dev build-essential pkg-config

# Build
go build -o main main.go

# Run
./main
```

## Expected Behavior

When you run the application:
1. A webview window opens with title "Test from GitHub via Replace"
2. Loads https://www.whatismybrowser.com/detect/what-is-my-user-agent/
3. Displays the custom user agent: `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36`

## How It Works

This application uses the `replace` directive in `go.mod` to use the forked version of webview_go with SetUserAgent support:

```go
replace github.com/webview/webview_go => github.com/kerimovkk/webview_go v0.1.0
```

The forked version includes:
- GTK/WebKit backend implementation using `webkit_settings_set_user_agent()`
- C API function `webview_set_user_agent()`
- Go method `SetUserAgent(ua string)`

## Platform Support

Currently implemented for:
- **Linux** (GTK/WebKit2)
