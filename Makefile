# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gesc android ios gesc-cross swarm evm all test clean
.PHONY: gesc-linux gesc-linux-386 gesc-linux-amd64 gesc-linux-mips64 gesc-linux-mips64le
.PHONY: gesc-linux-arm gesc-linux-arm-5 gesc-linux-arm-6 gesc-linux-arm-7 gesc-linux-arm64
.PHONY: gesc-darwin gesc-darwin-386 gesc-darwin-amd64
.PHONY: gesc-windows gesc-windows-386 gesc-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gesc:
	build/env.sh go run build/ci.go install ./cmd/gesc
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gesc\" to launch gesc."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gesc.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Gesc.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

gesc-cross: gesc-linux gesc-darwin gesc-windows gesc-android gesc-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gesc-*

gesc-linux: gesc-linux-386 gesc-linux-amd64 gesc-linux-arm gesc-linux-mips64 gesc-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-*

gesc-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gesc
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep 386

gesc-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gesc
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep amd64

gesc-linux-arm: gesc-linux-arm-5 gesc-linux-arm-6 gesc-linux-arm-7 gesc-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep arm

gesc-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gesc
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep arm-5

gesc-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gesc
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep arm-6

gesc-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gesc
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep arm-7

gesc-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gesc
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep arm64

gesc-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gesc
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep mips

gesc-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gesc
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep mipsle

gesc-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gesc
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep mips64

gesc-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gesc
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gesc-linux-* | grep mips64le

gesc-darwin: gesc-darwin-386 gesc-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gesc-darwin-*

gesc-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gesc
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-darwin-* | grep 386

gesc-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gesc
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-darwin-* | grep amd64

gesc-windows: gesc-windows-386 gesc-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gesc-windows-*

gesc-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gesc
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-windows-* | grep 386

gesc-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gesc
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gesc-windows-* | grep amd64