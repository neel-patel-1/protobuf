# Protobuf build files
LLVM_VERSION=9

CC=/home/nmpatel/XMPGym/deps/llvm-9/clang+llvm-9.0.0-x86_64-pc-linux-gnu/bin/clang-9
CXX=/home/nmpatel/XMPGym/deps/llvm-9/clang+llvm-9.0.0-x86_64-pc-linux-gnu/bin/clang++

OPT = /home/nmpatel/XMPGym/deps/llvm-9/clang+llvm-9.0.0-x86_64-pc-linux-gnu/bin/opt
CXX_FLAGS := -emit-llvm -g -S -O3 -I. -I./include -pthread -DOS_LINUX -DLEVELDB_PLATFORM_POSIX -DSNAPPY  -c -fPIC

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

XMP_PASS=/home/nmpatel/XMPGym/XMPPass/build/libXMPPass.so

PASS_CONFIG = -load $(XMP_PASS) -yield
OPT_CONFIG = -postdomtree -mem2reg -indvars -loop-simplify -branch-prob -scalar-evolution

SRCS := src/google/protobuf/any.pb.cc \
src/google/protobuf/api.pb.cc \
src/google/protobuf/duration.pb.cc \
src/google/protobuf/empty.pb.cc \
src/google/protobuf/field_mask.pb.cc \
src/google/protobuf/source_context.pb.cc \
src/google/protobuf/struct.pb.cc \
src/google/protobuf/timestamp.pb.cc \
src/google/protobuf/type.pb.cc \
src/google/protobuf/wrappers.pb.cc \
src/google/protobuf/any.cc \
src/google/protobuf/any_lite.cc \
src/google/protobuf/arena.cc \
src/google/protobuf/arena_align.cc \
src/google/protobuf/arenastring.cc \
src/google/protobuf/arenaz_sampler.cc \
src/google/protobuf/compiler/importer.cc \
src/google/protobuf/compiler/parser.cc \
src/google/protobuf/cpp_features.pb.cc \
src/google/protobuf/descriptor.cc \
src/google/protobuf/descriptor.pb.cc \
src/google/protobuf/descriptor_database.cc \
src/google/protobuf/dynamic_message.cc \
src/google/protobuf/extension_set.cc \
src/google/protobuf/extension_set_heavy.cc \
src/google/protobuf/feature_resolver.cc \
src/google/protobuf/generated_enum_util.cc \
src/google/protobuf/generated_message_bases.cc \
src/google/protobuf/generated_message_reflection.cc \
src/google/protobuf/generated_message_table_gen.cc \
src/google/protobuf/generated_message_tctable_full.cc \
src/google/protobuf/generated_message_tctable_gen.cc \
src/google/protobuf/generated_message_tctable_lite.cc \
src/google/protobuf/generated_message_util.cc \
src/google/protobuf/implicit_weak_message.cc \
src/google/protobuf/inlined_string_field.cc \
src/google/protobuf/io/coded_stream.cc \
src/google/protobuf/io/gzip_stream.cc \
src/google/protobuf/io/io_win32.cc \
src/google/protobuf/io/printer.cc \
src/google/protobuf/io/strtod.cc \
src/google/protobuf/io/tokenizer.cc \
src/google/protobuf/io/zero_copy_sink.cc \
src/google/protobuf/io/zero_copy_stream.cc \
src/google/protobuf/io/zero_copy_stream_impl.cc \
src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
src/google/protobuf/json/internal/lexer.cc \
src/google/protobuf/json/internal/message_path.cc \
src/google/protobuf/json/internal/parser.cc \
src/google/protobuf/json/internal/unparser.cc \
src/google/protobuf/json/internal/untyped_message.cc \
src/google/protobuf/json/internal/writer.cc \
src/google/protobuf/json/internal/zero_copy_buffered_stream.cc \
src/google/protobuf/json/json.cc \
src/google/protobuf/map.cc \
src/google/protobuf/map_field.cc \
src/google/protobuf/message.cc \
src/google/protobuf/message_lite.cc \
src/google/protobuf/parse_context.cc \
src/google/protobuf/port.cc \
src/google/protobuf/raw_ptr.cc \
src/google/protobuf/reflection_mode.cc \
src/google/protobuf/reflection_ops.cc \
src/google/protobuf/repeated_field.cc \
src/google/protobuf/repeated_ptr_field.cc \
src/google/protobuf/service.cc \
src/google/protobuf/stubs/common.cc \
src/google/protobuf/text_format.cc \
src/google/protobuf/unknown_field_set.cc \
src/google/protobuf/util/delimited_message_util.cc \
src/google/protobuf/util/field_comparator.cc \
src/google/protobuf/util/field_mask_util.cc \
src/google/protobuf/util/message_differencer.cc \
src/google/protobuf/util/time_util.cc \
src/google/protobuf/util/type_resolver_util.cc \
src/google/protobuf/wire_format.cc \
src/google/protobuf/wire_format_lite.cc \
src/google/protobuf/any.pb.cc \
src/google/protobuf/api.pb.cc \
src/google/protobuf/duration.pb.cc \
src/google/protobuf/empty.pb.cc \
src/google/protobuf/field_mask.pb.cc \
src/google/protobuf/source_context.pb.cc \
src/google/protobuf/struct.pb.cc \
src/google/protobuf/timestamp.pb.cc \
src/google/protobuf/type.pb.cc \
src/google/protobuf/wrappers.pb.cc \
src/google/protobuf/any.cc \
src/google/protobuf/any_lite.cc \
src/google/protobuf/arena.cc \
src/google/protobuf/arena_align.cc \
src/google/protobuf/arenastring.cc \
src/google/protobuf/arenaz_sampler.cc \
src/google/protobuf/compiler/importer.cc \
src/google/protobuf/compiler/parser.cc \
src/google/protobuf/cpp_features.pb.cc \
src/google/protobuf/descriptor.cc \
src/google/protobuf/descriptor.pb.cc \
src/google/protobuf/descriptor_database.cc \
src/google/protobuf/dynamic_message.cc \
src/google/protobuf/extension_set.cc \
src/google/protobuf/extension_set_heavy.cc \
src/google/protobuf/feature_resolver.cc \
src/google/protobuf/generated_enum_util.cc \
src/google/protobuf/generated_message_bases.cc \
src/google/protobuf/generated_message_reflection.cc \
src/google/protobuf/generated_message_table_gen.cc \
src/google/protobuf/generated_message_tctable_full.cc \
src/google/protobuf/generated_message_tctable_gen.cc \
src/google/protobuf/generated_message_tctable_lite.cc \
src/google/protobuf/generated_message_util.cc \
src/google/protobuf/implicit_weak_message.cc \
src/google/protobuf/inlined_string_field.cc \
src/google/protobuf/io/coded_stream.cc \
src/google/protobuf/io/gzip_stream.cc \
src/google/protobuf/io/io_win32.cc \
src/google/protobuf/io/printer.cc \
src/google/protobuf/io/strtod.cc \
src/google/protobuf/io/tokenizer.cc \
src/google/protobuf/io/zero_copy_sink.cc \
src/google/protobuf/io/zero_copy_stream.cc \
src/google/protobuf/io/zero_copy_stream_impl.cc \
src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
src/google/protobuf/json/internal/lexer.cc \
src/google/protobuf/json/internal/message_path.cc \
src/google/protobuf/json/internal/parser.cc \
src/google/protobuf/json/internal/unparser.cc \
src/google/protobuf/json/internal/untyped_message.cc \
src/google/protobuf/json/internal/writer.cc \
src/google/protobuf/json/internal/zero_copy_buffered_stream.cc \
src/google/protobuf/json/json.cc \
src/google/protobuf/map.cc \
src/google/protobuf/map_field.cc \
src/google/protobuf/message.cc \
src/google/protobuf/message_lite.cc \
src/google/protobuf/parse_context.cc \
src/google/protobuf/port.cc \
src/google/protobuf/raw_ptr.cc \
src/google/protobuf/reflection_mode.cc \
src/google/protobuf/reflection_ops.cc \
src/google/protobuf/repeated_field.cc \
src/google/protobuf/repeated_ptr_field.cc \
src/google/protobuf/service.cc \
src/google/protobuf/stubs/common.cc \
src/google/protobuf/text_format.cc \
src/google/protobuf/unknown_field_set.cc \
src/google/protobuf/util/delimited_message_util.cc \
src/google/protobuf/util/field_comparator.cc \
src/google/protobuf/util/field_mask_util.cc \
src/google/protobuf/util/message_differencer.cc \
src/google/protobuf/util/time_util.cc \
src/google/protobuf/util/type_resolver_util.cc \
src/google/protobuf/wire_format.cc \
src/google/protobuf/wire_format_lite.cc

BC_FILES := $(patsubst %.cc,%.bc,$(SRCS))

%.bc: %.cc
	$(CXX) $(CXX_FLAGS) $< -o $@

build_proto: $(BC_FILES)