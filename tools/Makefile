include config.mak

TARGET = $(LIB_OUTPUT)
OBJS = $(patsubst %.cpp,$(OBJDIR)/%.o,$(SOURCES))

all: $(TARGET)

$(TARGET): $(OBJS)
ifeq ($(LIB_TYPE),shared)
	$(CXX) $(CXXFLAGS) -shared -o $@ $^ $(LDFLAGS)
else ifeq ($(LIB_TYPE),static)
	$(AR) rcs $@ $^
else
	$(error "Invalid LIB_TYPE: $(LIB_TYPE)")
endif

$(OBJDIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(TARGET) $(OBJS)


install: install-headers

install-headers:
	@echo "Installing headers to $(PREFIX_DIR)/include"
	@find amf/public/common amf/public/include amf/public/src -name "*.h" | while read hdr; do \
		dest=$(PREFIX_DIR)/include/$${hdr#amf/}; \
		mkdir -p "$$(dirname "$$dest")"; \
		cp "$$hdr" "$$dest"; \
	done