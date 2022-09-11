TARGETS = \
	bin/tarai-gcc\
	bin/tarai-clang\
	bin/tarai-go\
	bin/tarai-zig\
	bin/tarai-zig_x64\
	bin/tarai-rust\


all : $(TARGETS)

bin/tarai-swift: tarai-swift.swift
	mkdir -p bin
	swiftc -O $< -o $@

bin/tarai-gcc: tarai-c.c
	mkdir -p bin
	gcc-12 -O2 $< -o $@

bin/tarai-clang: tarai-c.c
	mkdir -p bin
	clang -O2 $< -o $@

bin/tarai-go: tarai-go.go
	mkdir -p bin
	go build -o $@ $<

bin/tarai-zig: tarai-zig.zig
	mkdir -p bin
	zig build-exe -O ReleaseFast -femit-bin=bin/tarai-zig $<

bin/tarai-zig_x64: tarai-zig.zig
	mkdir -p bin
	zig build-exe -O ReleaseFast -target x86_64-macos-gnu -femit-bin=bin/tarai-zig_x64 $<

bin/tarai-rust: tarai-rust.rs
	mkdir -p bin
	rustc -O -C opt-level=3 -o $@ $<

clean :
	rm -f bin/*

ARGS = 15 7 0
test: all
	time bin/tarai-swift ${ARGS}
	time bin/tarai-gcc ${ARGS}
	time bin/tarai-clang ${ARGS}
	time bin/tarai-go ${ARGS}
	time bin/tarai-zig ${ARGS}
	time bin/tarai-zig_x64 ${ARGS}
	time bin/tarai-rust ${ARGS}
	time bin/tarai-swift ${ARGS}
	time bin/tarai-gcc ${ARGS}
	time bin/tarai-clang ${ARGS}
	time bin/tarai-go ${ARGS}
	time bin/tarai-zig ${ARGS}
	time bin/tarai-zig_x64 ${ARGS}
	time bin/tarai-rust ${ARGS}
