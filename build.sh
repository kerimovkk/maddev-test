#!/bin/bash
set -e

echo "🔧 Building SetUserAgent Demo Application"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step 1: Checking system dependencies${NC}"

# Check if required packages are installed
if ! pkg-config --exists gtk+-3.0 webkit2gtk-4.1 2>/dev/null; then
    echo "Required dependencies not found. Installing..."
    echo "This requires sudo password."
    sudo apt-get update
    sudo apt-get install -y \
        libwebkit2gtk-4.1-dev \
        libgtk-3-dev \
        build-essential \
        pkg-config
else
    echo -e "${GREEN}✓ Dependencies already installed${NC}"
fi

echo ""
echo -e "${BLUE}Step 2: Building Go application${NC}"

# Download Go dependencies
echo "Downloading Go dependencies..."
go mod download

# Build the application
echo "Compiling Go application..."
CGO_ENABLED=1 go build -o main main.go

echo ""
echo -e "${GREEN}✅ Build complete!${NC}"
echo ""
echo -e "${YELLOW}Run the application with:${NC}"
echo -e "  ${BLUE}./main${NC}"
echo ""
echo -e "${YELLOW}The application will:${NC}"
echo "  1. Open a webview window"
echo "  2. Navigate to whatismybrowser.com"
echo "  3. Display your custom user agent:"
echo "     ${BLUE}Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36${NC}"
echo ""
