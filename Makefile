# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gesn android ios gesn-cross swarm evm all test clean
.PHONY: gesn-linux gesn-linux-386 gesn-linux-amd64 gesn-linux-mips64 gesn-linux-mips64le
.PHONY: gesn-linux-arm gesn-linux-arm-5 gesn-linux-arm-6 gesn-linux-arm-7 gesn-linux-arm64
.PHONY: gesn-darwin gesn-darwin-386 gesn-darwin-amd64
.PHONY: gesn-windows gesn-windows-386 gesn-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gesn:
	build/env.sh go run build/ci.go install ./cmd/gesn
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gesn\" to launch gesn."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gesn.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Gesn.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/kevinburke/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go get -u github.com/golang/protobuf/protoc-gen-go
	env GOBIN= go install ./cmd/abigen
	@type "npm" 2> /dev/null || echo 'Please install node.js and npm'
	@type "solc" 2> /dev/null || echo 'Please install solc'
	@type "protoc" 2> /dev/null || echo 'Please install protoc'

# Cross Compilation Targets (xgo)

gesn-cross: gesn-linux gesn-darwin gesn-windows gesn-android gesn-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gesn-*

gesn-linux: gesn-linux-386 gesn-linux-amd64 gesn-linux-arm gesn-linux-mips64 gesn-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-*

gesn-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gesn
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep 386

gesn-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gesn
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep amd64

gesn-linux-arm: gesn-linux-arm-5 gesn-linux-arm-6 gesn-linux-arm-7 gesn-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep arm

gesn-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gesn
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep arm-5

gesn-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gesn
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep arm-6

gesn-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gesn
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep arm-7

gesn-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gesn
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep arm64

gesn-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gesn
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep mips

gesn-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gesn
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep mipsle

gesn-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gesn
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep mips64

gesn-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gesn
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gesn-linux-* | grep mips64le

gesn-darwin: gesn-darwin-386 gesn-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gesn-darwin-*

gesn-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gesn
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-darwin-* | grep 386

gesn-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gesn
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-darwin-* | grep amd64

gesn-windows: gesn-windows-386 gesn-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gesn-windows-*

gesn-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gesn
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-windows-* | grep 386

gesn-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gesn
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesn-windows-* | grep amd64